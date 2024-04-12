import 'package:Agricon/componments/customer_button.dart';
import 'package:Agricon/features/cart/widgets/cart_product.dart';
import 'package:Agricon/features/cart/widgets/cart_sub_total.dart';
import 'package:Agricon/features/cart/widgets/empty_cart.dart';
import 'package:Agricon/features/home/services/home_services.dart';
import 'package:Agricon/features/home/widgets/address_box.dart';
import 'package:Agricon/providers/user_provider.dart';
import 'package:Agricon/constants/global_veriables.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../address/screen/address_screen.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddressScreen(sum: totalSum),
      ),
    );
  }

  Future<void> getCartData() async {
    productMap.clear();
    userCart.clear();
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    print(user.cart);
    for (var element in user.cart) {
      final prod = await homeService.fetchProductById(
          context: context, id: element['productId']);

      if (prod != null) {
        productMap[prod.id!] = prod;
        userCart.add({
          prod: element['quantity'],
        });
        sum += (element['quantity'] * prod.price).round() as int;
      }
    }
    totalSum = sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              flexibleSpace: Container(
                decoration:
                    const BoxDecoration(color: GlobalVariables.appBarGradient),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.mic,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartSubtotal(
                      sum: totalSum,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text("Your order is eligible for FREE delivery", style: TextStyle(color: Colors.green),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text:
                            'Proceed to Buy (${userCart.length} item${(userCart.length == 1) ? "" : "s"})',
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
