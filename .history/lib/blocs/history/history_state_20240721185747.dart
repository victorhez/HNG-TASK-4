part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class CartLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends HistoryState {
  final Cart cart;

  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class HistoryError extends HistoryState {
  @override
  List<Object> get props => [];
}