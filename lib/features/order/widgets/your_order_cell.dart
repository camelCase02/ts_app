// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:Agricon/models/product.dart';
import 'package:flutter/material.dart';

class YourOrderCell extends StatelessWidget {
  final Product product;
  const YourOrderCell({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            product.images[0],
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('Delivered at ${DateTime.now()}'),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 20,
          ),
        ],
      ),
    );
  }
}
