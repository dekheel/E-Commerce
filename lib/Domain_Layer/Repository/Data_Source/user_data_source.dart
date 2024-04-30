import 'package:dartz/dartz.dart';

import '../../Entities/failures_entity.dart';
import '../../Entities/get_user_entity.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failures, GetUserEntity>> getUserData();
}
