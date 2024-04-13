import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Domain_Layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

import '../../../Domain_Layer/Repository/Data_Source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });
  }

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}
