// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:Agricon/componments/customer_button.dart';
import 'package:Agricon/componments/rating_stars.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/products/services/product_services.dart';
import 'package:Agricon/features/search/screens/search_screen.dart';
import 'package:Agricon/models/product.dart';
import 'package:Agricon/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductServices productService = ProductServices();
  double avgRating = 3.7;
  double myRating = 3.5;
  @override

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productService.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              leading: Icon(Icons.keyboard_arrow_left),
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
            )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: widget.product.images.map((i) {
                  return Builder(
                      builder: (BuildContext context) => Image.network(
                            i,
                            fit: BoxFit.fitHeight,
                            height: 200,
                          ));
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,

                ),
              ),
              Row(
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Text("3.7"),
                  Stars(rating: avgRating)
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Text("₹" + widget.product.price.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const Spacer(),
                  Text("Delivery by Sunday, 14 April")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Icon(Icons.location_on),
                  Text("Delivery to user",),
                  Spacer(),
                  Text("Roorkee 247667")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Add to Cart',
                onTap: addToCart,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Product Details",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.product.description,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Customer Reviews',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          const SizedBox(width: 5),
                          Text("Abhay Sharma"),
                          const Spacer(),
                          RatingBar.builder(
                            initialRating: myRating,
                            minRating: 1,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: GlobalVariables.secondaryColor,
                            ),
                            onRatingUpdate: (rating) {
                              productService.rateProduct(
                                context: context,
                                product: widget.product,
                                rating: rating,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      const Text("Very nice Product")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
