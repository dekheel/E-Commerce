import 'user_entity.dart';

class GenerateResponseEntity {
  GenerateResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}
