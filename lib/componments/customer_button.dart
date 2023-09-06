import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onTap ,
    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60)),
      child: Text(text),
    
    );
  }
}