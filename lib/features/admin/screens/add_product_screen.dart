import 'dart:io';

import 'package:amazon_clone/componments/custom_textfield.dart';
import 'package:amazon_clone/componments/customer_button.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/constants/utilis.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

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
List<File>images=[];
@override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }
String catergory= "Mobiles";
List<String> productcategories=[
  "Mobiles",
  "Essentials",
  "Appliances",
  "Books",
  "Fashion"
];

void selectImages ()async{
  var res = await pickImages();
  setState(() {
    images=res;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
              ),
              title: const Text(
                "Neues Produkt hinzufügen",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                GestureDetector(onTap: selectImages,
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
                              "Selekt Produkt Bild",
                              style: TextStyle(color: Colors.grey.shade400),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(controller: productNameController, hintText: "Produkt Name"),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(controller: descriptionController, hintText: "Beschreibung...", maxLines: 5,),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(
                  controller: priceController, hintText: "Preis"),
                const SizedBox(
                  height: 7,
                ),
                CustomTextfield(controller: quantityController, hintText: "Menge"), 
                 SizedBox(width: double.infinity,child: DropdownButton(items: productcategories.map((String item) {
                  return DropdownMenuItem(value: item,child: Text(item, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),);

                }).toList(), 
                  value: catergory, icon: const Icon(Icons.keyboard_arrow_down, ), onChanged: (String? newValue) {  setState(() {
                    catergory=newValue!;
                  });},),), 
                  const SizedBox(height: 30,),
                  CustomButton(onTap: () {
                    
                  }, text: "Fertig zum Verkauf!")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
