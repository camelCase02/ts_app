import 'dart:convert';

import 'package:Agricon/constants/error_handling.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/constants/utilis.dart';
import 'package:Agricon/models/Order.dart';
import 'package:Agricon/models/product.dart';
import 'package:Agricon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Product>> fetchProducts({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  Future<Product?> fetchProductById(
      {required BuildContext context, required String id}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product? product;
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products/id?id=$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          product = Product.fromJson(
            jsonEncode(
              jsonDecode(res.body),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product;
  }

  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('$uri/api/products/category?category=$category'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  Future<Product> fetchDealOfDay({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      name: '',
      description: '',
      quantity: 0,
      images: [],
      category: '',
      price: 0,
    );

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/deal-of-day'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          product = Product.fromJson(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product;
  }

  Future<void> orderComplete({
    required BuildContext context,
    required int sum,
  }) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      int i = 0;
      for (var element in user.cart) {
        i++;
        final order = Order(
          productId: element['productId'],
          quantity: element['quantity'],
          userId: user.id,
          orderedAt: DateTime.now(),
          status: "Pending",
          totalPrice: sum,
          orderedBy: user.id,
        );
        print("Before request");
        print(order.toMap());
        http.Response res = await http.post(
          Uri.parse('$uri/api/order'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: order.toJson(),
        );
        print("after request!");
        httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Oder Placed for Product $i !");
          },
        );
      }
      user.cart.clear();
      print("Before Cart CLear!!");
      http.Response res = await http.delete(
        Uri.parse('$uri/api/cart/clear'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      showSnackBar(context, "All Orders Placed!");
    } catch (e) {
      print(e);
      showSnackBar(context, "ERROR Occured: Cannot place order.");
    }
  }
}
