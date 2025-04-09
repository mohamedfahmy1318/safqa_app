import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/usecases/login_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit_login/login_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  LoginUseCase loginUseCase;
  TextEditingController mailController =
      TextEditingController(text: 'fahmy@yahoo.com');
  TextEditingController passwordController =
      TextEditingController(text: '12345aA??');

  var formKey = GlobalKey<FormState>();
  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.call(
        mailController.text,
        passwordController.text,
      );

      either.fold((error) {
        emit(LoginErrorState(errorMessage: error));
      }, (response) {
        emit(LoginSuccessState(loginResponseEntity: response));
      });
    }
  }
}
