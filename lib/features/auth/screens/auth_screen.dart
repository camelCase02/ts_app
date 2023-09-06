

import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:flutter/material.dart';

enum Auth{
 login,
 createAccount

}

class AuthScreen extends StatefulWidget {
  static const String routeName= '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

Auth _auth=Auth.createAccount;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
      const Text("Welcome", style: TextStyle(fontSize: 22),),

      ListTile(title: const Text("create Account",
       style: TextStyle(fontWeight: FontWeight.bold),),
       leading: Radio( 
        activeColor: GlobalVariables.secondaryColor,
        value:Auth.createAccount ,
        groupValue:_auth ,
        onChanged: (Auth?value) {
          setState(() {
            _auth=value!;
          });
        },
      ),),
      ListTile(title: const Text("Login",
       style: TextStyle(fontWeight: FontWeight.bold),),
       leading: Radio( 
        activeColor: GlobalVariables.secondaryColor,
        value:Auth.login ,
        groupValue:_auth ,
        onChanged: (Auth?value) {
          setState(() {
            _auth=value!;
          });
        },
      ),)
      
        ],),
      )),
    );
  }
}