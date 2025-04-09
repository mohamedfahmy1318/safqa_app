import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/cart/items_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemsInCartUseCase {
  final CartRepo cartRepo;

  DeleteItemsInCartUseCase(this.cartRepo);

  Future<Either<Failures, GetCartResponseEntity>> call(String productId) async {
    return await cartRepo.deleteItemsInCart(productId);
  }
}
