import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/featured_products.dart';
import 'package:amazon_clone/features/home/widgets/servicescard.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  String selectedCategory = "";
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
              actions: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          "Are you Sure?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        content: const Text(
                          "This will log out from this device",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              authService.logoutUser(context: context);
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
             // const AddressBox(),
              const SizedBox(
                height: 10,
              ),
              TopCategories(
                onCategorySelected: (category) {
                  setState(() {
                    if (category == selectedCategory) {
                      selectedCategory = "";
                    } else {
                      selectedCategory = category;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FeaturedProducts(selectedCategory: selectedCategory),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text( "Farmicon Services",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const ServicesCard(title: "Crop Doctor", description: "Turn your mobile phone into crop doctor: \n send us picture of your crop and get \n diagnosis of infected crop and its solution.", image:"assets/image 16.png" , buttontext:"Consult Now"),
              const ServicesCard(title: "Predict Crop Price", description: "Turn your mobile phone into crop doctor: \n send us picture of your crop and get \n diagnosis of infected crop and its solution.", image: "assets/crop_price.png", buttontext: "Predict Now")
            ],
          ),
        ));
  }
}
