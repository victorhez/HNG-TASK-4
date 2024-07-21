part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoaded extends HistoryState {
  final Cart cart;

  const HistoryLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class HistoryError extends HistoryState {
  @override
  List<Object> get props => [];
}
