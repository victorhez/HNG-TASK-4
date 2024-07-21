import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/cart.dart';

import 'package:shop_app/models/timbu_product.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryLoading()) {
    on<HistoryStarted>(_mapCartStartedEventToState);
    on<HistoryProductAdded>(_mapCartProductAddedEventToState);
    on<HistoryProductRemoved>(_mapCartProductRemovedEventToState);
  }

  void _mapCartStartedEventToState(event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  void _mapCartProductAddedEventToState(event, Emitter<CartState> emit) {
    final state = this.state;
    try {
      if (state is CartLoaded) {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      }
    } catch (_) {
      emit(CartError());
    }
  }

  void _mapCartProductRemovedEventToState(event, Emitter<CartState> emit) {
    final state = this.state;
    try {
      if (state is CartLoaded) {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      }
    } catch (_) {
      emit(CartError());
    }
  }
}