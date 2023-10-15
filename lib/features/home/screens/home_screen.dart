import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';

import 'package:flutter/material.dart';

import '../widgets/deal_of_day.dart';
import '../widgets/crausel_image.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
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
                          hintText: "Produkt auf Amazon suchen..."
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body:  const SingleChildScrollView(
        child: Column(children: [
          AddressBox(), 
        SizedBox(height: 10,),
        TopCategories(),
         SizedBox(height: 10,),
        CrauselImage(),
              DealOfDay()
        ],),
      )
    );
  }
}
