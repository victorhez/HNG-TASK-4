import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';

import 'package:shop_app/widgets/custom_app_bar.dart';

import 'history_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const routeName = '/tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': HomeScreen(),
      'title': 'Product List',
    },
    {
      'page': OrderHistory(),
      'title': 'Order History',
    },
    {
      'page': CartScreen(),
      'title': 'My Cart',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: CustomAppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffFAFAFA),
        shape: CircularNotchedRectangle(),
        height: 94,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff2A2A2A),
            onTap: _selectPage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/${_selectedPageIndex == 0 ? "home_active" : "home"}.svg",
                ),
                label: 'Product List',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/${_selectedPageIndex == 1 ? "checkout_active" : "cart"}.svg",
                ),
                label: 'My Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/${_selectedPageIndex == 2 ? "checkout_active" : "checkout"}.svg",
                ),
                label: 'Checkout',
              )
            ],
          ),
        ),
      ),
    );
  }
}
