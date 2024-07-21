part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryStarted extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class HistoryProductAdded extends HistoryEvent {
  final Item product;

  const HistoryProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Item product;

  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
