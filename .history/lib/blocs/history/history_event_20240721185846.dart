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

class HistoryProductRemoved extends HistoryEvent {
  final Item product;

  const HistoryProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
