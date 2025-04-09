import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/usecases/delete_items_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecases/update_items_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_view_model_state.dart';

@injectable
class CartViewModelCubit extends Cubit<CartStates> {
  CartViewModelCubit({
    required this.getItemsInCartUseCase,
    required this.deleteItemsInCartUseCase,
    required this.updateItemsInCartUseCase,
  }) : super(CartInitialState());
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;
  UpdateItemsInCartUseCase updateItemsInCartUseCase;
  List<GetProductsEntity> productsItemList = []; // <------>

  static CartViewModelCubit get(context) =>
      BlocProvider.of<CartViewModelCubit>(context);
  Future<void> getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.call();
    either.fold(
        (failure) => emit(
              GetCartErrorState(failure: failure),
            ), (response) {
      productsItemList = response.data!.products!;
      emit(
        GetCartSuccessState(
          getCartResponseEntity: response,
        ),
      );
    });
  }

  Future<void> deleteItemsInCart(String productId) async {
    var either = await deleteItemsInCartUseCase.call(productId);
    either.fold(
        (failure) => emit(
              DeleteCartErrorState(failure: failure),
            ), (response) {
      // productsItemList = response.data!.products!;
      emit(
        GetCartSuccessState(
          getCartResponseEntity: response,
        ),
      );
    });
  }

  Future<void> updateCountInCart(String productId, int count) async {
    var either = await updateItemsInCartUseCase.call(productId, count);
    either.fold(
      (failure) => emit(
        UpdateCountInCartErrorState(failures: failure),
      ),
      (response) {
        // productsItemList = response.data!.products!;
        emit(
          GetCartSuccessState(
            getCartResponseEntity: response,
          ),
        );
      },
    );
  }
}
