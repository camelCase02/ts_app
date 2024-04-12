import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/admin/screens/analytics.dart';
import 'package:Agricon/features/admin/screens/orders_screen.dart';
import 'package:Agricon/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../auth/services/auth_service.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = "/AdminScreen";
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AuthService authService = AuthService();
  int _page = 0;
  final double bottonBarWidth = 50;
  final double bottonBarBorderWidth = 5;
  final double bottonBarHeight= 40;

  List<Widget> pages = [
    const PostsScreen(),
    const AnalyticsScreen(),
    // const Center(
    //   child: Text("Analytics Page"),
    // ),
    const Center(
      child: Text("Offers Page"),
    ),
    
    const OrdersScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Icon(Icons.analytics, size: 23, color: _page == 1 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
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
                child: Icon(Icons.local_offer_sharp, size: 23, color: _page == 2 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
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
                child: Icon(Icons.local_shipping, size: 23, color: _page == 3 ? GlobalVariables.backgroundColor: Color(0xFF656565),),
              ),
              label: ""),
        ],
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(color: GlobalVariables.appBarGradient),
            ),
            title:const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Admin",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        "Are you Sure?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      content: const Text(
                        "This will log out from this device",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            authService.logoutUser(context: context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
      body: pages[_page],
    );
  }
}
