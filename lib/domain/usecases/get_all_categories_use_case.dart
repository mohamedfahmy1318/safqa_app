import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final HomeRepo homeRepo;
  GetAllCategoriesUseCase(this.homeRepo);
  Future<Either<Failures, CategoryOrBrandResponseEntity>> call() {
    return homeRepo.getAllCategories();
  }
}
