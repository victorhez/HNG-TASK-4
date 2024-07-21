import 'package:bloc/bloc.dart';

import 'product_event.dart';
import 'product_state.dart';
import '../../network/timbu_api.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    print("Fetching products...");
    try {
      final products = await ApiService().fetchProducts();
       print(products.items.length);
      emit(ProductLoadSuccess(products: products));
      print(products.items.length);
    } catch (error) {
      emit(ProductLoadFailure(error: error.toString()));
      print(error.toString());
    }
  }
}
