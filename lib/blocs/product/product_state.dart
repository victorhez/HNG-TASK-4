import 'package:equatable/equatable.dart';
import '../../models/timbu_product.dart';



abstract class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final ProductResponse products;

  const ProductLoadSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductLoadFailure extends ProductState {
  final String error;

  const ProductLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
