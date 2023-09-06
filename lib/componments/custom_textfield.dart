

import 'package:flutter/material.dart';


class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.controller,required this.hintText });
  final TextEditingController controller;
final String hintText;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller:controller ,
        decoration:  InputDecoration(hintText: hintText,
          border:const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green)
        ),enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green)
        ) ),
        validator: (value){
    
        },
      ),
    );
  }
}