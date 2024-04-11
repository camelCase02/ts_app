// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';

// import 'package:amazon_clone/constants/error_handling.dart';
// import 'package:amazon_clone/constants/global_veriables.dart';
// import 'package:amazon_clone/constants/utilis.dart';
// import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
// import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
// import 'package:amazon_clone/features/home/screens/home_screen.dart';
// import 'package:amazon_clone/models/user.dart';
// import 'package:amazon_clone/providers/user_provider.dart';
// import 'package:amazon_clone/router.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   void createAccount({
//     required String email,
//     required BuildContext context,
//     required String name,
//     required String type,
//     required String password,
//   }) async {
//     try {
//       User user = User(
//           id: "",
//           name: name,
//           password: password,
//           address: "",
//           type: type,
//           token: "",
//           email: email,
//           cart: []);

//       http.Response res = await http.post(Uri.parse("$uri/api/signup"),
//           body: user.toJson(),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8'
//           });

//       httpErrorHandler(
//           response: res,
//           context: context,
//           onSuccess: () {
//             showSnackBar(context, "Account created successfully! Please login");
//           });
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

  // void logoutUser({required BuildContext context}) async {
  //   try {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     await sharedPreferences.setString('x-auth-token', "");
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         generateRoute(
  //           const RouteSettings(name: AuthScreen.routeName),
  //         ),
  //         (route) => false);
  //     // }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

//   void loginUser({
//     required String email,
//     required BuildContext context,
//     required String password,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('$uri/api/login'),
//         body: jsonEncode({'email': email, 'password': password}),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       ); 
      

  //     httpErrorHandler(
  //         response: res,
  //         context: context,
  //         onSuccess: () async {
  //           SharedPreferences sharedPreferences =
  //               await SharedPreferences.getInstance();

  //           Provider.of<UserProvider>(context, listen: false).setUser(res.body);
  //           final user = jsonDecode(res.body);
  //           await sharedPreferences.setString('x-auth-token', user['token']);
  //           if (user["type"] == "admin") {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 generateRoute(
  //                   const RouteSettings(name: AdminScreen.routeName),
  //                 ),
  //                 (route) => false);
  //           } else {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 generateRoute(
  //                   const RouteSettings(name: HomeScreen.routeName),
  //                 ),
  //                 (route) => false);
  //           }
  //         });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

// //get user Data
  // Future<void> getUserData(
  //   BuildContext context,
  // ) async {
  //   print("IN_FETCH_USER_DATA");
  //   try {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     String? token = preferences.getString('x-auth-token');
  //     if (token == null) {
  //       preferences.setString('x-auth-token', '');
  //     }

  //     var tokenRes = await http.post(Uri.parse("$uri/tokenIsValid"),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'x-auth-token': token!
  //         });

  //     var response = jsonDecode(tokenRes.body);
  //     print(response);
  //     if (response == true) {
  //       http.Response userRes = await http.get(Uri.parse("$uri/"),
  //           headers: <String, String>{
  //             'Content-Type': 'application/json; charset=UTF-8',
  //             'x-auth-token': token
  //           });
  //       var userProvider = Provider.of<UserProvider>(context, listen: false);
  //       userProvider.setUser(userRes.body);
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
// }


import 'dart:convert';


import 'package:amazon_clone/componments/botton_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/constants/utilis.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Sign up user
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () => {
          showSnackBar(
            context,
            "Account created! Login with the same credentials",
          )
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // signin user
  void singInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

       httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            final user = jsonDecode(res.body);
            await sharedPreferences.setString('x-auth-token', user['token']);
            if (user["type"] == "admin") {
              Navigator.pushAndRemoveUntil(
                  context,
                  generateRoute(
                    const RouteSettings(name: AdminScreen.routeName),
                  ),
                  (route) => false);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  generateRoute(
                    const RouteSettings(name: BottonBar.routeName),
                  ),
                  (route) => false);
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  

  void logoutUser({required BuildContext context}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', "");
      Navigator.pushAndRemoveUntil(
          context,
          generateRoute(
            const RouteSettings(name: AuthScreen.routeName),
          ),
          (route) => false);
      // }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  // get user data
   Future<void> getUserData(
   BuildContext context,
  ) async {
    print("IN_FETCH_USER_DATA");
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse("$uri/tokenIsValid"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      print(response);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }}

