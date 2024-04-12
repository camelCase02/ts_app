import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/account/services/acount_services.dart';
import 'package:Agricon/features/order/screens/order_details_screen.dart';
import 'package:Agricon/models/Order.dart';
import 'package:flutter/material.dart';

import 'single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<dynamic>? list;
  final AccountServices accountServices = AccountServices();
  List<Order>? orders;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(
                    fontSize: 14, color: GlobalVariables.selectedNavBarColor),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: orders == null || orders!.isEmpty
              ? Text("No orders")
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        OrderDetailsScreen.routName,
                        arguments: orders![index],
                      ),
                      child: SingleProduct(
                        image:
                            "https://5.imimg.com/data5/SELLER/Default/2020/12/EH/ZL/PB/8762737/250-ml-hdpe-pesticide-bottle.jpg",
                      ),
                    );
                  }),
        )
      ],
    );
  }
}
