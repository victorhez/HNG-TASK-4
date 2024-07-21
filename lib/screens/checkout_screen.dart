import 'package:flutter/material.dart';
import 'package:shop_app/screens/payment_screen.dart';

import 'package:shop_app/widgets/custom_app_bar.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedOption = 'Option 1';
  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    Padding _buildTextFormField(BuildContext context, String labelText,
        TextEditingController controller, bool address) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 75,
              child: Text(
                labelText,
                style: TextStyle(
                    color: Color(0xff2A2A2A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                width: address ? 380 : 247,
                height: address ? 60 : 42,
                padding: EdgeInsets.only(left: 12, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border:
                        Border.all(color: Color(0xff2A2A2A).withOpacity(0.7))),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: address ? "" : "  Phone nos 1"),
                )),
            SizedBox(
              height: address ? 14 : 24,
            ),
            Visibility(
              visible: !address,
              child: Container(
                  width: 247,
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                          color: Color(0xff2A2A2A).withOpacity(0.7))),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, labelText: "   Phone nos 1"),
                  )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select how to receive your package(s)',
              style: TextStyle(
                  color: Color(0xff2A2A2A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Pickup',
              style: TextStyle(
                  color: Color(0xff2A2A2A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            ListTile(
              title: Text('Old Secretariat Complex, Area 1, Garki Abaji Abji',
                  style: TextStyle(
                      color: Color(0xff2A2A2A).withOpacity(0.64),
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              leading: Radio<String>(
                activeColor: Color(0xffFF7F7D),
                value: 'Option 1',
                groupValue: _selectedOption,
                onChanged: _handleRadioValueChange,
              ),
            ),
            ListTile(
              title: Text('Sokoto Street, Area 1, Garki Area 1 AMAC',
                  style: TextStyle(
                      color: Color(0xff2A2A2A).withOpacity(0.64),
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              leading: Radio<String>(
                value: 'Option 2',
                activeColor: Color(0xffFF7F7D),
                groupValue: _selectedOption,
                onChanged: _handleRadioValueChange,
              ),
            ),
            _buildTextFormField(context, 'Delivery', emailController, true),
            _buildTextFormField(context, 'Contact', nameController, false),
            SizedBox(height: 40),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PaymentScreen.routeName,
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
                    'Go to Payment',
                    style: TextStyle(
                        color: Color(0xff2A2A2A),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
