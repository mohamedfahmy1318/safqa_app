import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  final HomeRepo homeRepo;
  GetAllBrandsUseCase(this.homeRepo);
  Future<Either<Failures, CategoryOrBrandResponseEntity>> call() {
    return homeRepo.getAllBrands();
  }
}
