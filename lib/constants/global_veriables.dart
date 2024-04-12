import 'package:flutter/material.dart';

// String uri = "http://10.81.68.156:3000"; // change the IP ADDRESS !!
String uri = "http://10.81.15.40:3000"; // usman's IP

//String uri= "http://localhost:3000";
class GlobalVariables {
  // COLORS
  static const appBarGradient = Color(0xFF208579);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color(0xFF023731);
  static const unselectedNavBarColor = Colors.black87;

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Irrigation',
      'image': 'assets/irrigation.png',
    },
    {
      'title': 'Fertilizer',
      'image': 'assets/fertilizers.png',
    },
    {
      'title': 'Seed',
      'image': 'assets/seed.png',
    },
    {
      'title': 'Gear',
      'image': 'assets/gear.png',
    },
    {
      'title': 'Livestock',
      'image': 'assets/livestock_feed.png',
    },
  ];
}
