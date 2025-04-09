part of 'register_view_model_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

final class RegisterErrorState extends RegisterState {
  final Failures errorMessage;
  RegisterErrorState({required this.errorMessage});
}
