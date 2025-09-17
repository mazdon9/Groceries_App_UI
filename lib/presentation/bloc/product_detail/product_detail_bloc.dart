import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:groceries_app/presentation/bloc/product_detail/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<ToggleFavorite>((event, emit) {
      emit(state.copyWith(isFavorite: !state.isFavorite));
    });

    on<ChangeQuantity>((event, emit) {
      emit(state.copyWith(quantity: event.quantity));
    });

    on<ToggleProductDetailExpanded>((event, emit) {
      emit(state.copyWith(productDetailExpanded: !state.productDetailExpanded));
    });

    on<ToggleNutritionsExpanded>((event, emit) {
      emit(state.copyWith(nutritionsExpanded: !state.nutritionsExpanded));
    });

    on<ToggleReviewExpanded>((event, emit) {
      emit(state.copyWith(reviewExpanded: !state.reviewExpanded));
    });
  }
}
