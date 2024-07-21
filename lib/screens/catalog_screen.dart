import 'package:flutter/material.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/custom_app_bar.dart';
import 'package:shop_app/widgets/product_card.dart';

import '../models/timbu_product.dart';

class CatalogScreen extends StatelessWidget {
  final Item? category;
  final ProductResponse? categoryProducts;

  const CatalogScreen({super.key, this.category, this.categoryProducts});
  static const String routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: CustomAppBar(title: category!.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                product: category!,
                widthFactor: 2.2,
              ),
            );
          },
          itemCount: categoryProducts!.items.length,
        ),
      ),
    );
  }
}
