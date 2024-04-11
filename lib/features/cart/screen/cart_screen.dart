import 'package:amazon_clone/componments/customer_button.dart';
import 'package:amazon_clone/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone/features/cart/widgets/cart_sub_total.dart';
import 'package:amazon_clone/features/cart/widgets/empty_cart.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final homeService = HomeServices();
  List<Map<Product, int>> userCart = [];
  Map<String, Product> productMap = {};
  late int totalSum;
  void navigateToAddress(int sum) {
    // Navigator.pushNamed(context, Address.routeName,
    //     arguments: sum.toString());
  }
  Future<void> getCartData() async {
    productMap.clear();
    userCart.clear();
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    for (var element in user.cart) {
      final prod = await homeService.fetchProductById(
          context: context, id: element['productId']);
      if (prod != null) {
        productMap[prod.id!] = prod;
        userCart.add({
          prod: element['quantity'],
        });
      }
    }
    user.cart.map(
      ((e) => sum += e['quantity'] * productMap[e['productId']]!.price as int),
    );
    totalSum = sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchBar(),
      ),
      body: FutureBuilder(
        future: getCartData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset('assets/Animation.json'),
                ),
              ],
            ); // or some loading screen
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return userCart.isEmpty
              ? const EmptyCart()
              : Column(
                  children: [
                    const AddressBox(),
                    const CartSubtotal(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'Proceed to Buy (${userCart.length} items)',
                        onTap: () => navigateToAddress(totalSum),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          print(userCart[index].keys.first.id);
                          return CartProduct(
                            product: productMap[userCart[index].keys.first.id]!,
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
