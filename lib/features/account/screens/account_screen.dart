import 'package:Agricon/constants/global_veriables.dart';

import 'package:Agricon/features/account/widgets/orders.dart';
import 'package:Agricon/features/account/widgets/shopping_for.dart';
import 'package:flutter/material.dart';

import '../widgets/top_buttons.dart';
import '../widgets/under_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(color: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               UnderAppbar(),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                )
              ],
            ),
          )),
      body:  SingleChildScrollView(
        child: const Column(
          children: [
            
            SizedBox(
              height: 10,
            ),
            TopButtons(),
             SizedBox(
              height: 20,
            ),
            Orders(),
            ShoppingFor()
          ],
        ),
      ),
    );
  }
}
