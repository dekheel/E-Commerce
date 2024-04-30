import 'package:e_commerce/Ui_Layer/Auth/auth_states.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain_Layer/Use_Cases/auth_use_case.dart';

class LoginScreenViewModel extends Cubit<AuthStates> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(AuthInitialState());

  // todo: hold data
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController passwordController =
      TextEditingController(text: "1234567");
  TextEditingController emailController =
      TextEditingController(text: "adekheel@gmail.com");
  bool isObscure = true;
  late AuthUseCase loginUseCase;

// todo: handle functions
  void login() async {
    emit(AuthLoadingState());
    var either = await loginUseCase.loginInvoke(
      emailController.text,
      passwordController.text,
    );

    either.fold((l) {
      emit(AuthErrorState(errorMessage: l.errorMessage));
    }, (response) {
      SharedPreference.saveData(
          key: SharedPreference.userTokenKey, data: response.token);
      SharedPreference.saveData(
          key: SharedPreference.userEmail, data: emailController.text);

      emit(AuthSuccessState(authResultEntity: response));
    });
  }
}
