import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/usecases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'register_view_model_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitial());
  RegisterUseCase registerUseCase;

  TextEditingController fullNameController =
      TextEditingController(text: 'Mohamed Mohamed fahmy');
  TextEditingController phoneController =
      TextEditingController(text: '01003641066');
  TextEditingController mailController =
      TextEditingController(text: 'fahmy@yahoo.com');
  TextEditingController passwordController =
      TextEditingController(text: '12345aA??');
  TextEditingController rePasswordController =
      TextEditingController(text: '12345aA??');

  var formKey = GlobalKey<FormState>();
  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.call(
          mailController.text,
          passwordController.text,
          fullNameController.text,
          phoneController.text,
          rePasswordController.text);

      either.fold((error) {
        emit(RegisterErrorState(errorMessage: error));
      }, (response) {
        emit(RegisterSuccessState(registerResponseEntity: response));
      });
    }
  }
}
