import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/account/widgets/shopping_card.dart';
import 'package:Agricon/features/menu/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class ShoppingFor extends StatelessWidget {
  const ShoppingFor({super.key});

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
                "Keep Shopping For",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "Browsing History",
                style: TextStyle(
                    fontSize: 14, color: GlobalVariables.selectedNavBarColor),
              ),
            ),
          ],
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          children: [
            ShoppingCard(title: "Seeds", image: "assets/seed_full.png"),
            ShoppingCard(title: "Gear", image: "assets/gear_full.png"),
            ShoppingCard(
                title: "Fertilisers", image: "assets/fertilisers_full.png"),
            ShoppingCard(
                title: "Irrigation", image: "assets/irrigation_full.png")
          ],
        )
      ],
    );
  }
}
