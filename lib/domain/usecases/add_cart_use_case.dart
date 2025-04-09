import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  final HomeRepo homeRepo;
  AddCartUseCase(this.homeRepo);
  Future<Either<Failures, AddToCartResponseEntity>> call(String productId) {
    return homeRepo.addToCart(productId);
  }
}
