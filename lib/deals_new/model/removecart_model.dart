// To parse this JSON data, do
//
//     final removeCart = removeCartFromJson(jsonString);

import 'dart:convert';

RemoveCart removeCartFromJson(String str) =>
    RemoveCart.fromJson(json.decode(str));

String removeCartToJson(RemoveCart data) => json.encode(data.toJson());

class RemoveCart {
  Data data;
  String message;

  RemoveCart({
    required this.data,
    required this.message,
  });

  factory RemoveCart.fromJson(Map<String, dynamic> json) => RemoveCart(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String id;
  String user;
  List<Item> items;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Data({
    required this.id,
    required this.user,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        user: json["user"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Item {
  String product;
  int quantity;
  String id;

  Item({
    required this.product,
    required this.quantity,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: json["product"],
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "_id": id,
      };
}
