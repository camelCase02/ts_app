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
          product == null? const Text("No products listed"):
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                     Image.network(product![index].images[index], fit: BoxFit.fitHeight, alignment: Alignment.center,)
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
