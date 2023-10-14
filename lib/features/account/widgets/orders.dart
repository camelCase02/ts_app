import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text("Deine Bestellungen", style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
             Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Text("alle einsehen...", style: TextStyle(fontSize: 14,color: GlobalVariables.selectedNavBarColor),),
            )
          ],
        )
      ],
    );
  }
}
