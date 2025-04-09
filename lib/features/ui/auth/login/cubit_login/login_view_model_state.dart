import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}

final class LoginErrorState extends LoginState {
  final Failures errorMessage;
  LoginErrorState({required this.errorMessage});
}
