part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final Item product;

  const CartProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Item product;

  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
