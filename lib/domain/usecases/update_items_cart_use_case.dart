import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/cart/items_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateItemsInCartUseCase {
  final CartRepo cartRepo;

  UpdateItemsInCartUseCase(this.cartRepo);

  Future<Either<Failures, GetCartResponseEntity>> call(
      String productId, int count) async {
    return await cartRepo.updateCountInCart(productId, count);
  }
}
