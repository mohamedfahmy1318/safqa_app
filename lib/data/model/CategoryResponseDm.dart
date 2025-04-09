import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  String? message;
  String? statusMsg;
  CategoryOrBrandResponseDm({
    this.message,
    required this.statusMsg,
    super.results,
    super.metadata,
    super.data,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDm.fromJson(v));
      });
    }
  }
}

class CategoryOrBrandDm extends CategoryOrBrandEntity {
  CategoryOrBrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
