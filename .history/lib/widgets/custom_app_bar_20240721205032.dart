import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/wishlist_screen.dart';

PreferredSizeWidget CustomAppBar({
  Key? key,
  String? title,
  BuildContext? context,
}) {
  return AppBar(
    centerTitle: true,
    forceMaterialTransparency: true,
    backgroundColor: Color(0xffFAFAFA),
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      GestureDetector(
        onTap: () =>   Navigator.pushNamed(
                          context!,
                          WishlistScreen.routeName,
                        );,
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      SizedBox(
        width: 20,
      )
    ],
    title: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 4,
        ),
        Container(
          height: 40,
          width: 99,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/logo.png"))),
        ),
        SizedBox(
          width: 60,
        ),
        Text(title!,
            style: TextStyle(
                color: Color(0xff2A2A2A),
                fontSize: 19,
                height: 23.16,
                fontFamily: "montserrat",
                fontWeight: FontWeight.w500)),
      ],
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

@override
Size get preferredSize => Size.fromHeight(50);