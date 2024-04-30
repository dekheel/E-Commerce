import 'package:e_commerce/Data_Layer/Model/Response/product_response_dto.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_favorite_product_entity.dart';

class GetFavoriteProductDto extends GetFavoriteProductEntity {
  GetFavoriteProductDto(
      {super.status, super.count, super.data, super.message, super.statusMsg});

  GetFavoriteProductDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
}
