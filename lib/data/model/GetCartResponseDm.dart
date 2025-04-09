import 'package:ecommerce_app/data/model/ProductResponseDm.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDm extends GetCartResponseEntity {
  String? statusMsg;
  String? message;
  GetCartResponseDm({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataCartDm.fromJson(json['data']) : null;
  }
}

class GetDataCartDm extends GetDataCartEntity {
  GetDataCartDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductsDm extends GetProductsEntity {
  GetProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDm.fromJson(json['product']) : null;
    price = json['price'];
  }
}
