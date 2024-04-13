import 'package:e_commerce/Ui_Layer/Auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain_Layer/Use_Cases/login_use_case.dart';

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
  late LoginUseCase loginUseCase;

// todo: handle functions
  void login() async {
    emit(AuthLoadingState());
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );

    either.fold((l) {
      emit(AuthErrorState(errorMessage: l.errorMessage));
    }, (response) {
      emit(AuthSuccessState(authResultEntity: response));
    });
  }
}
