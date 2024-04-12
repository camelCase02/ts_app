import 'dart:convert';

class Order {
  final String? id;
  final String productId;
  final int quantity;
  final String orderedBy;
  final DateTime orderedAt;
  final String status;
  final int totalPrice;
  Order({
    this.id,
    required this.productId,
    required this.quantity,
    required this.orderedAt,
    required this.status,
    required this.totalPrice,
    required this.orderedBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'orderedBy': orderedBy,
      'orderedAt': orderedAt.toString(),
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'],
      productId: map['productId'],
      quantity: map['quantity'] as int,
      orderedBy: map['orderedBy'],
      orderedAt: DateTime.parse(map['orderedAt']),
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}