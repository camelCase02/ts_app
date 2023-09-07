

import 'package:amazon_clone/componments/custom_textfield.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:flutter/material.dart';

import '../../../componments/customer_button.dart';

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
final createAccountFormKey=GlobalKey<FormState>();
final loginFormKey=GlobalKey<FormState>();
final TextEditingController emailController= TextEditingController();
final TextEditingController passwordController= TextEditingController();
final TextEditingController nameController= TextEditingController();

@override
  void dispose() {
  
    super.dispose();
emailController.dispose();
passwordController.dispose();
nameController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      const Text("Welcome", style: TextStyle(fontSize: 22),),

      ListTile(
        tileColor: _auth==Auth.createAccount?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
        title: const Text("create Account",
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
      if(_auth==Auth.createAccount)
        Container(color: GlobalVariables.backgroundColor,
          child: Form(
            key: createAccountFormKey,
          child: Column(children: [
            CustomTextfield(controller:nameController ,
            hintText: "Name....",
            ),
            CustomTextfield(controller:emailController ,
            hintText: "Email....",
            ),
            CustomTextfield(controller:passwordController ,
            hintText: "password....",
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomButton(onTap: (){},
                         text: "Create an Account"),
             )
           
          ],),
          ),
        ),
      
      ListTile(  tileColor: _auth==Auth.login?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
        title: const Text("Login",
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
      ),),
      if(_auth==Auth.login)
        Container(color: GlobalVariables.backgroundColor,
          child: Form(
            key: createAccountFormKey,
          child: Column(children: [
           
            CustomTextfield(controller:emailController ,
            hintText: "Email....",
            ),
            CustomTextfield(controller:passwordController ,
            hintText: "password....",
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomButton(onTap: (){},
                         text: "Login"),
             )
           
          ],),
          ),
        ),
      
        ],),
      )),
    );
  }
}