import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getItemsCart();
  Future<Either<Failures, GetCartResponseEntity>> deleteItemsInCart(
      String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
