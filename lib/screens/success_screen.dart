import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/widgets/custom_app_bar.dart';

import '../blocs/cart/cart_bloc.dart';
import 'tabs_screen.dart';

class SucessScreen extends StatefulWidget {
  const SucessScreen({super.key});
  static const String routeName = '/success';

  @override
  State<SucessScreen> createState() => _SucessScreenState();
}

class _SucessScreenState extends State<SucessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      context.read<CartBloc>().add(CartStarted());
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => TabsScreen()), (route) => false);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: Stack(
        children: [
          Image.asset("assets/images/confetti.png"),
          SvgPicture.asset("assets/svg/success.svg"),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset("assets/images/confetti.png")),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              child: Image.asset("assets/images/confetti.png")),
        ],
      ),
    );
  }
}
