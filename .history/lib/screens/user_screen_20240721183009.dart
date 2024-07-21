import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});
  static const String routeName = '/orderhistory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Coming soon",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
