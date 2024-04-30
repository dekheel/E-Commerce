import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_user_entity.dart';

import '../Repository/Repository/user_repository.dart';

class GetUserUseCase {
  UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<Either<Failures, GetUserEntity>> getUserData() {
    return userRepository.getUserData();
  }
}
