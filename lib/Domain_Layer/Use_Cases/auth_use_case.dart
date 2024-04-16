import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';

import '../Entities/auth_result_entity.dart';
import '../Entities/failures_entity.dart';

class AuthUseCase {
  AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> loginInvoke(
      String email, String password) {
    return authRepository.login(
      email,
      password,
    );
  }

  Future<Either<Failures, AuthResultEntity>> registerInvoke(String name,
      String email, String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
