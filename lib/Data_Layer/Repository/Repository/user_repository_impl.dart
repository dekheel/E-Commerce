import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_user_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/user_data_source.dart';

import '../../../Domain_Layer/Repository/Repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failures, GetUserEntity>> getUserData() {
    return userRemoteDataSource.getUserData();
  }
}
