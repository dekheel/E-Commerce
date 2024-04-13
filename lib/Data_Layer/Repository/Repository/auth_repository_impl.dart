import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> login(
      String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
