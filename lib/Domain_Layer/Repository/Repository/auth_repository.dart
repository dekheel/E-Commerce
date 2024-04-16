import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

import '../../Entities/auth_result_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
