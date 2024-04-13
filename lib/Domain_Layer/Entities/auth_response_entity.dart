import 'package:e_commerce/Domain_Layer/Entities/user_entity.dart';

class AuthResponseEntity {
  AuthResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}
