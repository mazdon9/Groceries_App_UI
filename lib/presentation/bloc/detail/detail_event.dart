import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class OnLoadProductDetailEvent extends DetailEvent {
  final int productId;

  const OnLoadProductDetailEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class OnClearDetailErrorMessage extends DetailEvent {
  const OnClearDetailErrorMessage();
}
