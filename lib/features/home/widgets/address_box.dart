import 'package:Agricon/providers/user_provider.dart';
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
        color: Color.fromARGB(255, 107, 219, 206),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(children: [
          const Icon(Icons.location_on, size:20 ,),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text("Deliver to ${user.user.name} ", overflow: TextOverflow.ellipsis),
                const Spacer(),
                Text( "${user.user.address}", overflow: TextOverflow.ellipsis),
              ],
            ),
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
