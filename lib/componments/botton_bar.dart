import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottonBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int _page = 0;
  final double bottonBarWidth = 42;
  final double bottonBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Card"),
    )
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
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottonBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottonBarBorderWidth),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Container(
                width: bottonBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottonBarBorderWidth),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                width: bottonBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottonBarBorderWidth),
                  ),
                ),
                child: const Badge(
                    label: Text("2"),
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    child: Icon(Icons.shopping_cart_outlined)),
              ),
              label: "")
        ],
      ),
    );
  }
}
