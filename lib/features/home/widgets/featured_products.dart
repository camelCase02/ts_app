import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/products/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FeaturedProducts extends StatefulWidget {
  final String? selectedCategory;

  const FeaturedProducts({Key? key, this.selectedCategory}) : super(key: key);

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  final HomeServices homeServices = HomeServices();

  late List<Product> product;

  Future<void> fetchFeaturedProducts() async {
    if (widget.selectedCategory == '') {
      product = await homeServices.fetchProducts(context: context);
    } else {
      product = await homeServices.fetchCategoryProducts(
          context: context, category: widget.selectedCategory!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchFeaturedProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset('assets/Animation.json'),
          ); // or some loading screen
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.selectedCategory == ""
                        ? "Featured Products"
                        : widget.selectedCategory!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                product.isEmpty
                    ? const Text("No products listed")
                    : SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProductDetailScreen(
                                      product: product[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  children: [
                                    Image.network(
                                      product[index].images[0],
                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: product.length,
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
