



import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address; 
  final String type;
  final String token;

  User({required this.id, required this.name, required this.password, required this.address, required this.type, required this.email, required this.token});

   // Convert a User into a JSON-formatted map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email':email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  // Convert a JSON-formatted map into a User.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? "",
      email:map['email']??"",
      name: map['name'] ?? "",
      password: map['password'] ?? "",
      address: map['address'] ?? "",
      type: map['type'] ?? "",
      token: map['token'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}






