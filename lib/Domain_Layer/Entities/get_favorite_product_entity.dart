import 'package:e_commerce/Domain_Layer/Entities/product_response_entity.dart';

class GetFavoriteProductEntity {
  GetFavoriteProductEntity(
      {this.status, this.count, this.data, this.message, this.statusMsg});

  String? status;
  String? message;
  String? statusMsg;

  num? count;
  List<ProductEntity>? data;
}
