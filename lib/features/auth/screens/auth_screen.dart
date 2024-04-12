import 'package:Agricon/componments/custom_textfield.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../componments/customer_button.dart';

enum Auth { login, createAccount }

enum UserType { admin, user }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.createAccount;
  UserType _userType = UserType.user;
  final createAccountFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userTypeController =
      TextEditingController(text: "user");
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void createAccountforUser() {
    authService.signUpUser(
        context: context,
        email: emailController.text,
        name: nameController.text,
        type: userTypeController.text,
        password: passwordController.text);
  }

  void loginforUser() {
    authService.singInUser(
        email: emailController.text,
        context: context,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22),
            ),
            ListTile(
              tileColor: _auth == Auth.createAccount
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.createAccount,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.createAccount)
              Container(
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: createAccountFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: nameController,
                        hintText: "Name....",
                      ),
                      CustomTextfield(
                        controller: emailController,
                        hintText: "Email....",
                      ),
                      CustomTextfield(
                        controller: passwordController,
                        hintText: "password....",
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Radio(
                              activeColor: GlobalVariables.secondaryColor,
                              value: UserType.admin,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                if (value == null) return;
                                if (value == UserType.admin) {
                                  setState(() {
                                    userTypeController.text = "admin";
                                    _userType = value;
                                  });
                                }
                              },
                            ),
                            const Text(
                              "Admin Account",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              activeColor: GlobalVariables.secondaryColor,
                              value: UserType.user,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                if (value == null) return;
                                if (value == UserType.user) {
                                  setState(() {
                                    userTypeController.text = "user";
                                    _userType = value;
                                  });
                                }
                              },
                            ),
                            const Text(
                              "Consumer Account",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            onTap: () {
                              if (createAccountFormKey.currentState!
                                  .validate()) {
                                createAccountforUser();
                              }
                            },
                            text: "Create an Account"),
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.login
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.login,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.login)
              Container(
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: emailController,
                        hintText: "Email....",
                      ),
                      CustomTextfield(
                        controller: passwordController,
                        hintText: "password....",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            onTap: () {
                              if (loginFormKey.currentState!.validate()) {
                                loginforUser();
                              }
                            },
                            text: "Login"),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
