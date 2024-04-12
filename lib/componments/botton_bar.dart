import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/account/screens/account_screen.dart';
import 'package:Agricon/features/cart/screen/cart_screen.dart';
import 'package:Agricon/features/home/screens/home_screen.dart';
import 'package:Agricon/features/menu/screen/menu_screen.dart';
import 'package:flutter/material.dart';

class BottonBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int _page = 0;
  final double bottonBarWidth = 50;
  final double bottonBarHeight= 40;
  final double bottonBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
    const MenuScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: bottonBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _page == 0? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                ),
                child: Icon(Icons.home_filled, size: 23, color: _page == 0 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
              ),
              label: ""),
              BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: bottonBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _page == 1? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                ),
                child: Icon(Icons.shopping_cart, size: 23, color: _page == 1 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: bottonBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _page == 2? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                ),
                child:  Icon(Icons.person, size: 23, color: _page ==2 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: bottonBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _page == 3? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                ),
                child: Icon(Icons.menu, size: 23, color: _page == 3 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
              ),
              label: ""),
        ],

      ),
    );
  }
}
