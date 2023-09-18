import 'package:amazon_clone/componments/botton_bar.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
case AuthScreen.routeName:
return MaterialPageRoute(settings: routeSettings,
  builder: (_)=> const AuthScreen());
  case BottonBar.routeName:
return MaterialPageRoute(settings: routeSettings,
  builder: (_)=> const BottonBar());
case HomeScreen.routeName:
return MaterialPageRoute(settings: routeSettings,
  builder: (_)=> const HomeScreen());
  default:
 
return MaterialPageRoute(settings: routeSettings,
  builder: (_)=> const Scaffold(body: Center(
    child: Text("ERROR"),
  ),));
  }
}