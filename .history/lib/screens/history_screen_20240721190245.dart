import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/history/history_bloc.dart';
import '../widgets/cart_product_card.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});
  static const String routeName = '/orderhistory';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HistoryLoaded) {
            if (state.cart.products.isEmpty) {
              return Center(
                child: Text(
                  "No Item in O",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          product: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cart
                              .productQuantity(state.cart.products)
                              .values
                              .elementAt(index),
                        );
                      },
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .keys
                          .length,
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    // OrderSummary(),
                  ],
                ),
              ),
            );
          } else {
            return Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
