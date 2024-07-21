import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/blocs/wishlist/wishlist_bloc.dart';

import 'package:shop_app/models/timbu_product.dart';
import 'package:shop_app/models/wishlist.dart';

import '../blocs/cart/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Item product;
  final double widthFactor;
  final bool? isWishlist;

  ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.isWishlist = false,
  }) : super(key: key);
  List<int> rating = [
    3,
    4,
    5,
  ];
  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    final double height = MediaQuery.of(context).size.height;
    rating.shuffle();
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              child: Image.network(
                "https://api.timbu.cloud/images/${product.photos[0].url}",
                fit: BoxFit.cover,
                width: widthValue + 30,
                height: height * 0.6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  product.description ?? "Testing",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating.first ? Icons.star : Icons.star_border,
                      size: 19,
                      color: Color(0xffFFC657),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'N${oCcy.format(product.currentPrice[0].price["NGN"]![0])}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        Fluttertoast.showToast(
                          msg: "Item added to cart.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        height: 38,
                        width: widthValue * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Color(0xffFF7F7D))),
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style:
                              TextStyle(color: Color(0xff2A2A2A), fontSize: 13),
                        )),
                      ),
                    ),
                    Text("Add to Wishlist")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final oCcy = new NumberFormat("#,##0.00", "en_US");
