import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepo homeRepo;
  GetAllProductsUseCase(this.homeRepo);
  Future<Either<Failures, ProductResponseEntity>> call() {
    return homeRepo.getAllProducts();
  }
}
