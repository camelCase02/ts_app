import 'dart:convert';

import 'package:Agricon/constants/error_handling.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/constants/utilis.dart';
import 'package:Agricon/models/product.dart';
import 'package:Agricon/models/user.dart';
import 'package:Agricon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/cart/add'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );
      print(res.body.toString());
      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Added to Cart!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/cart/remove'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Removed from cart!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      showSnackBar(context, "Thanks for Rating the product!!");
      // http.Response res = await http.post(
      //   Uri.parse('$uri/api/rate-product'),
      //   headers: {
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'x-auth-token': userProvider.user.token,
      //   },
      //   body: jsonEncode({
      //     'id': product.id!,
      //     'rating': rating,
      //   }),
      // );
      //
      // httpErrorHandler(
      //   response: res,
      //   context: context,
      //   onSuccess: () {},
      // );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
