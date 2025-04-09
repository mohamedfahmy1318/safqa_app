import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);
  Future<Either<Failures, LoginResponseEntity>> call(
      String email, String password) async {
    return await _repository.login(email, password);
  }
}
