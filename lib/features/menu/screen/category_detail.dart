import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/products/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryDetail extends StatefulWidget {
  final String? selectedCategory;

  const CategoryDetail({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  final HomeServices homeServices = HomeServices();

  late List<Product> product;

  Future<void> fetchFeaturedProducts() async {
    product = await homeServices.fetchCategoryProducts(
        context: context, category: widget.selectedCategory!);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: FutureBuilder(
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
                      widget.selectedCategory!,
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
                          height: 500,
                          width: double.infinity,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 250,
                                    childAspectRatio: 170 / 219,
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
                                child: Card(
                                  margin: EdgeInsets.all(8),
                                  surfaceTintColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: Image.network(
                                            product[index].images[0],
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            product[index].name,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 7, right: 3, bottom: 2),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Text("₹" +
                                                    "" +
                                                    product[index]
                                                        .price
                                                        .toString())),
                                            Expanded(
                                                flex: 1,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                        GlobalVariables
                                                            .selectedNavBarColor,
                                                      ),
                                                    )))
                                          ],
                                        ),
                                      ),
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
      ),
    );
  }
}
