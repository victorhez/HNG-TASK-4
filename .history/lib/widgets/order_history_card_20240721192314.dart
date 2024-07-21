import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';

import 'package:shop_app/models/timbu_product.dart';

import 'product_card.dart';

class HistoryProductCard extends StatelessWidget {
  final Item product;
  final int quantity;

  const HistoryProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / 2.5;

    rating.shuffle();
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: height * 0.12,
        padding: EdgeInsets.only(
          left: 15,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff2A2A2A).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://api.timbu.cloud/images/${product.photos[0].url}",
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
            SizedBox(width: 10),
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
                  'Buy Again',
                  style: TextStyle(color: Color(0xff2A2A2A), fontSize: 13),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<int> rating = [
  3,
  4,
  5,
];
