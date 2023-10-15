import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/account/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
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
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/amazon_in.png",
                    width: 120,
                    height: 45,
                  ),
                ),
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
      body:  const Column(
        children: [
          UnderAppbar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
           SizedBox(
            height: 20,
          ),
          Orders(),
          DealOfDay()
        ],
      ),
    );
  }
}
