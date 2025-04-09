import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstants.baseUrl + endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> postData({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endpoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> putData({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      ApiConstants.baseUrl + endpoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> deleteData({
    required String endpoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      ApiConstants.baseUrl + endpoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
