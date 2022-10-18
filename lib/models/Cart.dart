// ignore: file_names
import 'package:cjays/models/Product.dart';

class CartModel {
  int id = 0;
  String name = '';
  int price = 0;
  String image = '';
  int quantity = 0;
  bool isExist = false;
  String time = '';
  Product product = Product();

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.isExist,
    required this.time,
    required this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product =
        (json['product'] != null ? Product.fromJson(json['product']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['quantity'] = quantity;
    data['isExist'] = isExist;
    data['time'] = time;
    data['product'] = product.toJson();
    return data;
  }
}
