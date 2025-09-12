import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class DeleteAProductInCartUsecase extends UsecaseAsync<void, int> {
  final IProductRepository iProductRepository;

  DeleteAProductInCartUsecase(this.iProductRepository);

  @override
  ResultFuture<void> call(int id) {
    return iProductRepository.deleteAProductInCart(id);
  }
}
