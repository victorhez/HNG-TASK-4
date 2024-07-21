import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';

import 'package:shop_app/models/timbu_product.dart';

import 'product_card.dart';

class CartProductCard extends StatelessWidget {
  final Item product;
  final int quantity;

  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    product.description ?? ' Testing',
                    style: TextStyle(fontSize: 11, color: Color(0xff2A2A2A)),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(HistoryProductRemoved(product));
                            },
                            icon: SvgPicture.asset("assets/svg/remove.svg"),
                          ),
                          Text(
                            '$quantity',
                            style: TextStyle(
                                color: Color(0xff2A2A2A),
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(HistoryProductAdded(product));
                            },
                            icon: SvgPicture.asset("assets/svg/add.svg"),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(HistoryProductRemoved(product));
                          Fluttertoast.showToast(
                            msg: "Item removed from cart.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.black,
                            fontSize: 16.0,
                          );
                        },
                        child: SvgPicture.asset("assets/svg/delete.svg")),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'N${oCcy.format(product.currentPrice[0].price["NGN"]![0])}',
                      style: TextStyle(
                          color: Color(0xff2A2A2A),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                SizedBox(height: 26),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
