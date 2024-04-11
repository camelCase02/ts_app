import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  final HomeServices homeServices = HomeServices();

  List<Product>? product;
  List<String> image = [
    "assets/pesticide.png",
    "assets/nutrient.png",
    "assets/wheat.png",
    "assets/hummer.png"
    "assets/pesticide.png",
  ];
  List<String> name = [
    "Bloom Buddy Organic Pesticide",
    "BloomField Crop Nutrient",
    "Godavari Wheat Seeds- 2Kg",
    "BloomField Crop Nutrient",
    "Godavari Wheat Seeds- 2Kg",

  ];
  List<String> description = [
    "B jjds cndc cnne",
    "Blcndjncnc cjdncnt",
    "Gcdjncjnc ccg",
    "Blocdjncjndc ient",
        "Blocdjncjndc ient"

  ];
  List<String> price = ["20", "10", "58", "20","20"];

  @override
  void initState() {
    super.initState();
    fetchFeaturedProducts();
  }

  fetchFeaturedProducts() async {
    product = await homeServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Featured Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //product == null? const Text("No products listed"):
          GridView.builder(
            shrinkWrap: true,
            itemCount: image.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset(image[index])),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(name[index],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("₹" + "" + price[index])),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Add"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color.fromARGB(142, 15, 238, 212))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
