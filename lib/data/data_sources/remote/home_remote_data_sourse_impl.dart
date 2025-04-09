import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_end_points.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/cache/shared_pref_helper.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/AddCartResponseDm.dart';
import 'package:ecommerce_app/data/model/CategoryResponseDm.dart';
import 'package:ecommerce_app/data/model/ProductResponseDm.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/data_sources/remote/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourseImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourseImpl(this.apiManager);
  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await apiManager.getData(
          endpoint: EndPoints.getCategories,
        );
        var getAllCategories =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategories);
        } else {
          return Left(
            ServerFailure(message: getAllCategories.message ?? 'no message'),
          );
        }
      } else {
        return const Left(
          NetworkFailure(message: 'no internet connection'),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await apiManager.getData(
          endpoint: EndPoints.getBrands,
        );
        var getAllBrands = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrands);
        } else {
          return Left(
            ServerFailure(message: getAllBrands.message ?? 'no message'),
          );
        }
      } else {
        return const Left(
          NetworkFailure(message: 'no internet connection'),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await apiManager.getData(
          endpoint: EndPoints.getProducts,
          queryParameters: {
            'limit': 15,
            'page': 2,
          },
        );
        var getAllProducts = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProducts);
        } else {
          return Left(
            ServerFailure(message: getAllProducts.message ?? 'no message'),
          );
        }
      } else {
        return const Left(
          NetworkFailure(message: 'no internet connection'),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failures, AddCartResponseDm>> addToCart(
      String productId) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefHelper.getData(key: 'token');
        var response = await apiManager.postData(
          endpoint: EndPoints.addToCard,
          body: {
            'productId': productId,
          },
          headers: {
            'token': token,
          },
        );
        var addCartResponse = AddCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addCartResponse);
        } else {
          return Left(
            ServerFailure(message: addCartResponse.message ?? 'no message'),
          );
        }
      } else {
        return const Left(
          NetworkFailure(message: 'no internet connection'),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
