import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repo/repos/cart/items_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  final CartRepo cartRepo;

  GetItemsInCartUseCase(this.cartRepo);

  Future<Either<Failures, GetCartResponseEntity>> call() async {
    return await cartRepo.getItemsCart();
  }
}
