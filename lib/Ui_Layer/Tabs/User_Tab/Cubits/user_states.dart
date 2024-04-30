import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

abstract class UserStates {}

class UserInitialStates extends UserStates {}

class UserErrorStates extends UserStates {
  Failures? failures;

  UserErrorStates({required this.failures});
}

class UserLoadingStates extends UserStates {
  String? message;

  UserLoadingStates({required this.message});
}

class UserSuccessStates extends UserStates {
  UserSuccessStates();
}
