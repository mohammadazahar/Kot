// To parse this JSON data, do
//
//     final addCart = addCartFromJson(jsonString);

import 'dart:convert';

AddCart addCartFromJson(String str) => AddCart.fromJson(json.decode(str));

String addCartToJson(AddCart data) => json.encode(data.toJson());

class AddCart {
  Data data;
  String message;
  int total;

  AddCart({
    required this.data,
    required this.message,
    required this.total,
  });

  factory AddCart.fromJson(Map<String, dynamic> json) => AddCart(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "total": total,
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
