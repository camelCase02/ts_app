import 'package:amazon_clone/features/menu/screen/category_detail.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SearchScreen(searchQuery: widget.title,)
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 10,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(widget.image)),
          ],
        ),
      ),
    );
}
}