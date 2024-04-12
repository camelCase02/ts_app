import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/menu/widgets/menu_box.dart';
import 'package:amazon_clone/features/menu/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
                          borderSide: BorderSide(color: Colors.black, width: 1),
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
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 170/219, crossAxisCount: 2),
              shrinkWrap: true,
          children: [
            MenuCard(title: "Compound Fertilizers", image: "assets/compound_fertilizers.png"),
            MenuCard(title: "Crop Seeds", image: "assets/Crop_seeds.png"),
            MenuCard(title: "Irrigation Equipment", image: "assets/irrigation_equipment.png"),
            MenuCard(title: "Protective Gear", image: "assets/protective_gear.png")
          ],
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuBox(text: "Orders"),
            const SizedBox(width: 10,),
            MenuBox(text: "History"),
            const SizedBox(width: 10,),
            MenuBox(text: "Account"),
            const SizedBox(width: 10,),
            MenuBox(text: "Whishlist"),
            const SizedBox(width: 20,),
      
          ],
        )
      ]),
    );
  }
}
