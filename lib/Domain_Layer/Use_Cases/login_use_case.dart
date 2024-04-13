import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';

import '../Entities/auth_result_entity.dart';
import '../Entities/failures_entity.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<FailuresEntity, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepository.login(
      email,
      password,
    );
  }
}
