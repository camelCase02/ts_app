import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                DottedBorder(child: Container(width: double.infinity,height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        
                  child: Column(children: [
                    const Icon(Icons.folder_open_outlined, size: 40,), 
                    const SizedBox(height: 15,),
                    Text("Selekt Produkt Bild", style: TextStyle(color: Colors.grey.shade400),)
                  ],),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
