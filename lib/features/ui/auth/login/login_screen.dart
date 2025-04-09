import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/core/cache/shared_pref_helper.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/dialog_utils.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit_login/login_view_model_cubit.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit_login/login_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: "Waiting...");
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage.message,
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            posActionName: 'Go To Home',
            posAction: () {
              SharedPrefHelper.saveData(
                key: 'token',
                value: state.loginResponseEntity.token,
              );
              Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 60.h, bottom: 40.h, left: 97.w, right: 97.w),
                  child: Text(
                    'SAfQA',
                    style: AppStyles.semi24White.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 65.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To SAFQA',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "E-MAil",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.emailAddress,
                                  isObscureText: false,
                                  hintText: "Enter Your Mail",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: viewModel.mailController,
                                  validator: AppValidators.validateEmail),
                              Text(
                                "Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: "Enter Your Password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.visibility_off)),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.regular18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  textStyle: AppStyles.semi20Primary,
                                  text: "Login",
                                  onPressed: () {
                                    viewModel.login();
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.registerRoute);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Don’t have an account? Create Account',
                                          style: AppStyles.medium18White,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
