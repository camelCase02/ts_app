import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/featured_products.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

import '../widgets/crausel_image.dart';
import '../widgets/deal_of_day.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    color: GlobalVariables.appBarGradient),
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
              // actions: [
              //   TextButton(
              //     onPressed: () {
              //       showDialog(
              //         context: context,
              //         builder: (BuildContext context) => AlertDialog(
              //           title: const Text(
              //             "Are you Sure?",
              //             style: TextStyle(fontWeight: FontWeight.w600),
              //           ),
              //           content: const Text(
              //             "This will log out from this device",
              //             style: TextStyle(fontWeight: FontWeight.w600),
              //           ),
              //           actions: [
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.of(context).pop();
              //               },
              //               child: const Text("No"),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 authService.logoutUser(context: context);
              //               },
              //               child: const Text("Yes"),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //     child: const Text(
              //       "Logout",
              //       style: TextStyle(
              //           fontStyle: FontStyle.italic,
              //           fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ],
            )),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              AddressBox(),
              SizedBox(
                height: 10,
              ),
              TopCategories(),
              SizedBox(
                height: 10,
              ),
              FeaturedProducts(),
              //CrauselImage(),
              //DealOfDay()
            ],
          ),
        ));
  }
}
