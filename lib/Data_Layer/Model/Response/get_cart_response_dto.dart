import 'package:e_commerce/Data_Layer/Model/Response/product_response_dto.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto(
      {super.status,
      super.numOfCartItems,
      super.data,
      this.message,
      this.statusMsg});

  String? statusMsg;

  String? message;

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    data = json['data'] != null ? GetCartDto.fromJson(json['data']) : null;
  }
}

class GetCartDto extends GetCartEntity {
  GetCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductsDto extends GetProductsEntity {
  GetProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDto.fromJson(json['product']) : null;
    price = json['price'];
  }
}
