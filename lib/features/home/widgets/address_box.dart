import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 114, 226, 221),
        Color.fromARGB(255, 162, 236, 233)
      ])),
      child:  Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(children: [
          const Icon(Icons.location_on_outlined, size:20 ,),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text("Lieferung zu ${user.user.name} in ${user.user.address}", overflow: TextOverflow.ellipsis),
          )),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.arrow_drop_down_outlined, size: 18,),
          )

        ],),
      ),
    );
  }
}
