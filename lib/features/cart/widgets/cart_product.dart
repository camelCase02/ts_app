// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:Agricon/features/products/services/product_services.dart';
import 'package:Agricon/models/product.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  final Product product;
  const CartProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductServices productServices = ProductServices();

  void increaseQuantity(Product product) {
    productServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    productServices.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    // final productCart = context.watch<UserProvider>().user.cart[widget.index];
    // final product = Product.fromMap(productCart['product']);
    // final quantity = productCart['quantity'];
    int quantity = 0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.images[0],
                fit: BoxFit.fitWidth,
                height: 135,
                width: 135,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '₹ ${widget.product.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'Eligible for FREE Shipping',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Text(
                      'In Stock',
                      style: TextStyle(color: Colors.teal),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap:() {
                                    decreaseQuantity(widget.product);
                                    setState(() {
                                      quantity =quantity-1;
                                    });
                                    
                                  }, 
                                  child: Container(
                                    width: 35,
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.remove,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 1.5,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Container(
                                    width: 35,
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: Text(quantity.toString()),
                                  ),
                                ),
                                InkWell(
                                  onTap:() {
                                    increaseQuantity(widget.product);
                                    setState(() {
                                      quantity = quantity+1;
                                    });
                                    
                                  }, 
                                  child: Container(
                                    width: 35,
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all()),
                              child:const Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Save for later"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              decreaseQuantity(widget.product);
                            },
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all()),
                              child:const Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.delete, color: Colors.red,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider()
        ],
      ),
    );
  }
}
