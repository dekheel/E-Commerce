import 'package:e_commerce/Domain_Layer/Use_Cases/auth_use_case.dart';
import 'package:e_commerce/Ui_Layer/Auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utils/shared_preferences.dart';

class RegisterScreenViewModel extends Cubit<AuthStates> {
  RegisterScreenViewModel({required this.authUseCase})
      : super(AuthInitialState());

  // todo: hold data
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "Ali");
  TextEditingController passwordController =
      TextEditingController(text: "1234567");
  TextEditingController confirmationPasswordController =
      TextEditingController(text: "1234567");
  TextEditingController emailController =
      TextEditingController(text: "adekheel@gmail.com");
  TextEditingController phoneController =
      TextEditingController(text: "01201346231");
  bool isObscure = true;
  AuthUseCase authUseCase;

// todo: handle functions
  void register() async {
    emit(AuthLoadingState());
    var either = await authUseCase.registerInvoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);

    either.fold((l) {
      emit(AuthErrorState(errorMessage: l.errorMessage));
    }, (response) {
      SharedPreference.saveData(
          key: SharedPreference.userTokenKey, data: response.token);
      emit(AuthSuccessState(authResultEntity: response));
    });
  }
}
