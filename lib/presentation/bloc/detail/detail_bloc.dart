import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/repositories/product_repository.dart';
import 'package:groceries_app/presentation/bloc/detail/detail_event.dart';
import 'package:groceries_app/presentation/bloc/detail/detail_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final IProductRepository _productRepository;

  DetailBloc(this._productRepository) : super(const DetailState()) {
    on<OnLoadProductDetailEvent>(_onLoadProductDetail);
    on<OnClearDetailErrorMessage>(_onClearErrorMessage);
  }

  Future<void> _onLoadProductDetail(
    OnLoadProductDetailEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _productRepository.getProductById(event.productId);

    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, apiErrorMessage: failure.toString()),
      ),
      (productDetail) => emit(
        state.copyWith(isLoading: false, productDetailEntity: productDetail),
      ),
    );
  }

  void _onClearErrorMessage(
    OnClearDetailErrorMessage event,
    Emitter<DetailState> emit,
  ) {
    emit(state.copyWith(apiErrorMessage: ''));
  }
}
