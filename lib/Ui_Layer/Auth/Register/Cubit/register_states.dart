import 'package:e_commerce/Domain_Layer/Entities/auth_result_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity? authResultEntity;

  RegisterSuccessState({required this.authResultEntity});
}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}
