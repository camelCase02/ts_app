

import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
     int _page = 0;
  final double bottonBarWidth = 42;
  final double bottonBarBorderWidth = 5;

List<Widget>pages= [
 const PostsScreen(),
 const Center(child: Text("Analytics Page"),),
   const Center(child: Text("Orders"),)
];


  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            
          ), label: "Posts"),
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
            child: const Icon(Icons.analytics_outlined),
            
          ), label: "Analytics"),
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
            child: const Icon(Icons.all_inbox_outlined),
            
          ), label: "Orders")
        ],
      ),

       appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/amazon_in.png",
                    width: 120,
                    height: 45,
                  ),
                ),
               const Text("Admin", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),)
              ],
            ),
          )),
      body: pages[_page],
      );
  }
}