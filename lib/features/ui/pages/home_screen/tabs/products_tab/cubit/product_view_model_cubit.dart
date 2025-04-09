import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/usecases/add_cart_use_case.dart';
import 'package:ecommerce_app/domain/usecases/get_all_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel(
      {required this.getAllProductsUseCase, required this.addCartUseCase})
      : super(ProductInitialState());
  GetAllProductsUseCase getAllProductsUseCase;
  AddCartUseCase addCartUseCase;
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;
  static ProductViewModel get(context) => BlocProvider.of(context);
  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    final result = await getAllProductsUseCase.call();
    result.fold((error) {
      emit(
        ProductErrorState(message: error),
      );
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  Future<void> addToCart(String productId) async {
    emit(AddCartLoadingState());
    final result = await addCartUseCase.call(productId);
    result.fold(
      (error) {
        emit(
          AddCartErrorState(
            message: error,
          ),
        );
      },
      (response) {
        numOfCartItems = response.numOfCartItems!.toInt();
        print('numOfCartItems: $numOfCartItems');

        emit(
          AddCartSuccessState(
            addToCartResponseEntity: response,
          ),
        );
      },
    );
  }
}
