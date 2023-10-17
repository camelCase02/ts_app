

import 'package:flutter/material.dart';


class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.controller,required this.hintText,  this.maxLines=1 });
  final TextEditingController controller;
final String hintText;
final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(maxLines: maxLines,
        controller:controller ,
        decoration:  InputDecoration(hintText: hintText,
          border:const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green)
        ),enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green)
        ) ),
        validator: (value){
          if(value==null||value.isEmpty){
            return "Enter your $hintText";
          } return null;
        },
      ),
    );
  }
}