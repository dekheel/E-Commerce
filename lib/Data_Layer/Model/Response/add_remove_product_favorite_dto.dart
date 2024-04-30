import 'package:e_commerce/Domain_Layer/Entities/add_remove_product_favorite_entity.dart';

class AddRemoveProductFavoriteDto extends AddRemoveProductFavoriteEntity {
  AddRemoveProductFavoriteDto(
      {super.status, super.message, super.data, super.statusMsg});

  AddRemoveProductFavoriteDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
