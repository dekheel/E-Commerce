import 'package:dartz/dartz.dart';

import '../../Entities/auth_result_entity.dart';
import '../../Entities/failures_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
