import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_end_points.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/LoginResponseDm.dart';
import 'package:ecommerce_app/data/model/RegisterResponseDM.dart';
import 'package:ecommerce_app/domain/repo/data_sources/remote/auth_remote-data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseDm>> register(String email,
      String password, String name, String phone, String rePassword) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await apiManager.postData(
          endpoint: EndPoints.signup,
          body: {
            "email": email,
            "password": password,
            "name": name,
            "phone": phone,
            "rePassword": rePassword
          },
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(
            ServerFailure(message: registerResponse.message ?? 'no message'),
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
  Future<Either<Failures, LoginResponseDm>> login(
      String email, String password) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await apiManager.postData(
          endpoint: EndPoints.signin,
          body: {
            "email": email,
            "password": password,
          },
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(
            ServerFailure(message: loginResponse.message ?? 'no message'),
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
