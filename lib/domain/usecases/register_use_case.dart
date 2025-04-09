import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<Failures, RegisterResponseEntity>> call(String email,
      String password, String name, String phone, String rePassword) async {
    return await _repository.register(email, password, name, phone, rePassword);
  }
}
