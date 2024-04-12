import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  const MenuBox({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1)),
        child: Text(text),
      ),
    );
  }
}
