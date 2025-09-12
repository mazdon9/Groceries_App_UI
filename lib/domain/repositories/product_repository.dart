import 'package:groceries_app/domain/core/result.dart';

abstract class IProductRepository {
  ResultFuture<void> deleteAProductInCart(int id);
}
