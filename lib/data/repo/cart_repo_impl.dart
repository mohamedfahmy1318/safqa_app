import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/data_sources/remote/cart_remote_data_sourse.dart';
import 'package:ecommerce_app/domain/repo/repos/cart/items_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getItemsCart() async {
    var either = await cartRemoteDataSource.getItemsCart();
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemsInCart(
      String productId) async {
    var either = await cartRemoteDataSource.deleteItemsInCart(productId);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }
}
