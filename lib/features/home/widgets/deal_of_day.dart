import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: const Text("Angebot des Tages"),
      ),
      Image.network(
        "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
        height: 225,
        fit: BoxFit.fitHeight,
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(
          left: 20,
          top: 5,
        ),
        child: const Text(
          "999,99€",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 5, right: 40),
        child: const Text(
          "Mac Book",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            Image.network(
              "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            Image.network(
              "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            Image.network(
              "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            
          ],
        ),
      ),
      Container(padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child:  Text("Alle Details anschauen", overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.cyan.shade800),),
            )
    ]);
  }
}
