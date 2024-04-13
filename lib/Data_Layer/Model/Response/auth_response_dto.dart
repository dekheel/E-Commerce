import 'package:e_commerce/Domain_Layer/Entities/auth_result_entity.dart';

import 'Error.dart';
import 'User_dto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti265465@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MGM5ZGRkYmU4YjUyMzIzNWFhZTNkMCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyMTAyODc4LCJleHAiOjE3MTk4Nzg4Nzh9.Id6X_6lJn0S_HgfCQiE1jUtqMLdxAbdGAZVFp2FmN10"

class AuthResponseDto {
  AuthResponseDto({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  AuthResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error =
        json['errors'] != null ? ErrorResponse.fromJson(json['errors']) : null;

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  ErrorResponse? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }

    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
