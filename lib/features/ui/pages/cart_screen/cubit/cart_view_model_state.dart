part of 'cart_view_model_cubit.dart';

@immutable
sealed class CartStates {}

final class CartInitialState extends CartStates {}

final class GetCartLoadingState extends CartStates {}

final class GetCartSuccessState extends CartStates {
  final GetCartResponseEntity getCartResponseEntity;
  GetCartSuccessState({required this.getCartResponseEntity});
}

final class GetCartErrorState extends CartStates {
  final Failures failure;
  GetCartErrorState({required this.failure});
}

//-------------------------------------------------------------
final class DeleteCartLoadingState extends CartStates {}

final class DeleteCartSuccessState extends CartStates {
  final GetCartResponseEntity deleteCartResponseEntity;
  DeleteCartSuccessState({required this.deleteCartResponseEntity});
}

final class DeleteCartErrorState extends CartStates {
  final Failures failure;
  DeleteCartErrorState({required this.failure});
}

//---------------------------------------------------
class UpdateCountInCartLoadingState extends CartStates {}

final class UpdateCountInCartErrorState extends CartStates {
  final Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

final class UpdateCountInCartSuccessState extends CartStates {
  final GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
