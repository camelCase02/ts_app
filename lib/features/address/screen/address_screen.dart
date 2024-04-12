import 'package:Agricon/componments/custom_textfield.dart';
import 'package:Agricon/componments/customer_button.dart';
import 'package:Agricon/features/home/services/home_services.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  final int sum;
  const AddressScreen({Key? key, required this.sum}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final homeService = HomeServices();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchBar(),
      ),
      body: Column(
        children: [
          Text("Subtotal : ${widget.sum.toString()}"),
          CustomTextfield(controller: addressController, hintText: 'Address'),
          Text("or"),
          CustomTextfield(controller: addressController, hintText: 'Address'),
          CustomTextfield(controller: addressController, hintText: 'Address'),
          CustomTextfield(controller: addressController, hintText: 'Address'),
          CustomTextfield(controller: addressController, hintText: 'Address'),
          CustomButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    "Payment Done!",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  content: const Text(
                    "Thank you for shopping with us\nHead to the order section for more details!",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await homeService.orderComplete(
                          context: context,
                          sum: widget.sum,
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                ),
              );
            },
            text: 'Pay With ',
          ),
        ],
      ),
    );
  }
}
