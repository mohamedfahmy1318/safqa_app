import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_end_points.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/cache/shared_pref_helper.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/GetCartResponseDm.dart';
import 'package:ecommerce_app/domain/repo/data_sources/remote/cart_remote_data_sourse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;
  CartRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Either<Failures, GetCartResponseDm>> getItemsCart() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefHelper.getData(key: 'token');
        var response = await apiManager.getData(
          endpoint: EndPoints.addToCard,
          headers: {
            'token': token,
          },
        );
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(
            ServerFailure(message: getCartResponse.message ?? 'no message'),
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
  Future<Either<Failures, GetCartResponseDm>> deleteItemsInCart(
      String productId) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefHelper.getData(key: 'token');
        var response = await apiManager.deleteData(
          endpoint: '${EndPoints.addToCard}/$productId',
          headers: {
            'token': token,
          },
        );
        var deleteCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else {
          return Left(
            ServerFailure(message: deleteCartResponse.message ?? 'no message'),
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
  Future<Either<Failures, GetCartResponseDm>> updateCountInCart(
      String productId, int count) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefHelper.getData(key: 'token');
        var response = await apiManager.putData(
          endpoint: '${EndPoints.addToCard}/$productId',
          headers: {
            'token': token,
          },
          body: {
            'count': count,
          },
        );
        var updateCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCartResponse);
        } else {
          return Left(
            ServerFailure(message: updateCartResponse.message ?? 'no message'),
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
