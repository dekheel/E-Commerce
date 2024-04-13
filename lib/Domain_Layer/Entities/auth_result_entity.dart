import 'user_entity.dart';

class AuthResultEntity {
  UserEntity? userEntity;

  String? token;

  AuthResultEntity({this.token, this.userEntity});
}
