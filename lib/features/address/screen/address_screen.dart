import 'package:Agricon/componments/custom_textfield.dart';
import 'package:Agricon/componments/customer_button.dart';
import 'package:Agricon/constants/global_veriables.dart';
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
  final TextEditingController addressController =
      TextEditingController(text: "382, Radkakrishnan Bhawan, IIT Roorkee");
  final TextEditingController addressController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(color: GlobalVariables.appBarGradient),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Subtotal : ₹ ${widget.sum.toString()}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              CustomTextfield(
                  controller: addressController, hintText: 'Address'),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "OR",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  controller: addressController2, hintText: 'Address Line 1'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(controller: addressController2, hintText: 'City'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  controller: addressController2, hintText: 'State'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  controller: addressController2, hintText: 'Pincode'),
              const SizedBox(
                height: 10,
              ),
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
                text: 'Pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
