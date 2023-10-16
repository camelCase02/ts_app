
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(child: Text("Products"),),
      floatingActionButton: FloatingActionButton(onPressed: navigateToAddProduct, 
      tooltip: "Neues Produkt hochladen",
      child: const Icon(Icons.addchart_rounded),
      
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      );
  }
}