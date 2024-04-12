import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/constants/utilis.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key, required this.title, required this.description, required this.image, required this.buttontext });

  final String title;
  final String description;
  final String image;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin:const EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(title, style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5,),
                  Text(description, style:const TextStyle(fontSize: 12,)),
                  const SizedBox(height: 5,),
                  TextButton(style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(GlobalVariables.selectedNavBarColor) ), onPressed: (){showSnackBar(context, "Coming Soon");}, child: Text(buttontext, style: TextStyle(color: Colors.white),),)
              ],
            ),
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}