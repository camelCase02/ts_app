import 'dart:io';

import 'package:amazon_clone/componments/custom_textfield.dart';
import 'package:amazon_clone/componments/customer_button.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/constants/utilis.dart';
import 'package:amazon_clone/features/admin/services/admin_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<File> images = [];

  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  String catergory = "Fertilizer";
  List<String> productcategories = [
    "Fertilizer",
    "Seeds",
    "Gears",
    "Livestock Feed",
    "Irrigation"
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }
  void sellProducts() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      AdminService().sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: catergory, 
          images: images);
          
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    color: GlobalVariables.appBarGradient),
              ),
              title: const Text(
                "Add a new product",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _addProductFormKey,
            child: Column(
              children: [
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((e) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open_outlined,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Select Product Photos",
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  )
                                ],
                              ),
                            )),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                    controller: productNameController,
                    hintText: "Product Name"),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(controller: priceController, hintText: "Price"),
                const SizedBox(
                  height: 7,
                ),
                CustomTextfield(
                    controller: quantityController, hintText: "Quantity"),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    items: productcategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                    value: catergory,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        catergory = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(onTap: 
                    sellProducts, text: "Ready to sell!")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
