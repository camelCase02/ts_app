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
  ];
  List<String> name = [
    "Bloom Buddy Organic Pesticide",
    "BloomField Crop Nutrient",
    "Godavari Wheat Seeds- 2Kg",
    "BloomField Crop Nutrient"
  ];
  List<String> description = [
    "B jjds cndc cnne",
    "Blcndjncnc cjdncnt",
    "Gcdjncjnc ccg",
    "Blocdjncjndc ient"
  ];
  List<String> price= [
    "20","10","58","20"
  ];


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
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: image.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    Image.asset(image[index]),
                    Text(name[index], style:const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Row(
                      children: [
                        Text("₹"+""+ price[index]),
                        TextButton(onPressed: () {
                        }, child: Text("Add"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF023731))), )
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
