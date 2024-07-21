import 'package:equatable/equatable.dart';

import 'package:shop_app/models/timbu_product.dart';

class Wishlist extends Equatable {
  final List<Item> products;

  const Wishlist({this.products = const <Item>[]});

  @override
  List<Object?> get props => [products];
}
