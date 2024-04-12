import 'package:flutter/material.dart';

String uri = "http://10.81.68.156:3000"; // change the IP ADDRESS !!
//String uri = "http://10.81.15.40:3000"; // usman's IP

//String uri= "http://localhost:3000";
class GlobalVariables {
  // COLORS
  static const appBarGradient = Color(0xFF208579);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color(0xFF023731);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

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
