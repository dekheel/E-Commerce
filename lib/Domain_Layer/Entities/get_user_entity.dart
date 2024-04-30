class GetUserEntity {
  GetUserEntity({
    this.totalUsers,
    this.users,
  });

  num? totalUsers;
  List<UserEntity>? users;
}

class UserEntity {
  UserEntity({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  UserEntity.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? name;
  String? email;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['createdAt'] = createdAt;
    return map;
  }
}
