import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/screens/success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static const String routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Padding _buildTextFormField(
      BuildContext context, String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
                color: Color(0xff2A2A2A),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
              width: 380,
              height: 47,
              padding: EdgeInsets.only(left: 12, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border:
                      Border.all(color: Color(0xff2A2A2A).withOpacity(0.7))),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: "   $placeholder"),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xffFAFAFA),
          leading: BackButton(
            color: Color(0xff2A2A2A),
          ),
          title: Text("Payment",
              style: TextStyle(
                  color: Color(0xff2A2A2A),
                  fontSize: 19,
                  height: 23.16,
                  fontWeight: FontWeight.w700))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/card.svg"),
            SizedBox(
              height: 50,
            ),
            _buildTextFormField(context, "Card Number", "0000 0000 0000 0000"),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 179,
                  child: _buildTextFormField(context, "Expiry Date", "MM/YY"),
                ),
                SizedBox(
                  width: 179,
                  child: _buildTextFormField(context, "CVV", "123"),
                ),
              ],
            ),
            SizedBox(
              height: 63,
            ),
            Center(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if(state is )
                      Navigator.pushNamed(
                        context,
                        SucessScreen.routeName,
                      );
                    },
                    child: Container(
                      height: 43,
                      width: 307,
                      decoration: BoxDecoration(
                        color: Color(0xffFF7F7D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'Make Payment',
                        style: TextStyle(
                            color: Color(0xff2A2A2A),
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
