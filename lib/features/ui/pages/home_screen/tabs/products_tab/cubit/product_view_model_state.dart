part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductStates {}

final class ProductInitialState extends ProductStates {}

final class ProductLoadingState extends ProductStates {}

final class ProductSuccessState extends ProductStates {
  final ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}

final class ProductErrorState extends ProductStates {
  final Failures message;
  ProductErrorState({required this.message});
}

final class AddCartLoadingState extends ProductStates {}

final class AddCartSuccessState extends ProductStates {
  final AddToCartResponseEntity addToCartResponseEntity;
  AddCartSuccessState({required this.addToCartResponseEntity});
}

final class AddCartErrorState extends ProductStates {
  final Failures message;
  AddCartErrorState({required this.message});
}
