import 'package:e_commerce/Domain_Layer/Entities/get_user_entity.dart';

class GetUserDto extends GetUserEntity {
  GetUserDto(
      {super.totalUsers,
      this.metadata,
      super.users,
      this.message,
      this.statusMsg});

  GetUserDto.fromJson(dynamic json) {
    totalUsers = json['totalUsers'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(UserDto.fromJson(v));
      });
    }
  }

  Metadata? metadata;

  String? message;
  String? statusMsg;
}

class UserDto extends UserEntity {
  UserDto({
    super.id,
    super.name,
    super.email,
    super.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
  }
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
