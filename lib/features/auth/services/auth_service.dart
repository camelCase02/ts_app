import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/constants/utilis.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AuthService {
  void createAccount({
    required String email,
    required BuildContext context,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          address: "",
          type: "",
          token: "",
          email: email);

      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      // ignore: use_build_context_synchronously
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account erfolgreich erstellt");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
