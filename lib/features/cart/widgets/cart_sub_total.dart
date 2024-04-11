import 'package:flutter/material.dart';

class CartSubtotal extends StatelessWidget {
  final int sum;
  const CartSubtotal({Key? key, required this.sum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text(
            'Subtotal',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            ' ₹ $sum',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
