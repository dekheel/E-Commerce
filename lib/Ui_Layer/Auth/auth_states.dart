import 'package:e_commerce/Domain_Layer/Entities/auth_result_entity.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  AuthResultEntity? authResultEntity;

  AuthSuccessState({required this.authResultEntity});
}

class AuthErrorState extends AuthStates {
  String? errorMessage;

  AuthErrorState({required this.errorMessage});
}
