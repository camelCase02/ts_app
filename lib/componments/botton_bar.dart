import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:flutter/material.dart';

class BottonBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  final int _page = 0;
  final double bottonBarWidth = 42;
  final double bottonBarBorderWidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
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
            
          ), label: "Home"),
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
            
          ), label: ""),
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
            child: const Icon(Icons.home_outlined),
            
          ), label: "")
        ],
      ),
    );
  }
}
