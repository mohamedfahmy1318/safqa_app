import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String email,
      String password, String name, String phone, String rePassword);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
