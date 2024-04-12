import 'package:Agricon/features/menu/screen/category_detail.dart';
import 'package:Agricon/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SearchScreen(searchQuery: widget.title,)
          ),
        );
      },
      child:Card(
       elevation: 10,
       surfaceTintColor: Colors.white,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
       child: 
           Image.asset(widget.image, fit:BoxFit.fill),
         
       ),
      
    );
}
}