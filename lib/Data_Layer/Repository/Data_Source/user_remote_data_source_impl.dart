import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_user_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/user_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  ApiManager apiManager;

  UserRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetUserEntity>> getUserData() async {
    var either = await apiManager.getUserData();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }
}
