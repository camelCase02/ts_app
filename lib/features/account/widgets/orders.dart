import 'package:Agricon/constants/global_veriables.dart';
import 'package:flutter/material.dart';

import 'single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<dynamic>? list;

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
          child: list==null? Text("No orders"): ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list!.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list![index].toString(),
                );
              }),
        )
      ],
    );
  }
}
