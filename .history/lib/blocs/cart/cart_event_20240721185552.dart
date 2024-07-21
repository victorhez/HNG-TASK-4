part of 'cart_bloc.dart';

@immutable
abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends HistoryEvent {
  final Item product;

  const CartProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class HistoryProductRemoved extends HistoryEvent {
  final Item product;

  const HistoryProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
