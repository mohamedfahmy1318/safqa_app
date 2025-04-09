import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repo/repos/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
