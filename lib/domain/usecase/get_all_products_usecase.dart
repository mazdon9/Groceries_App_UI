import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllProductsUsecase
    extends UsecaseAsync<ListOfCategoryProductsEntity, NoParams> {
  final IProductRepository _productRepository;

  GetAllProductsUsecase(this._productRepository);

  @override
  ResultFuture<ListOfCategoryProductsEntity> call(NoParams params) {
    return _productRepository.getShopProducts();
  }
}
