import 'dart:convert';

class CartList {
  Data? data;
  String? message;
  int? total;

  CartList({
    this.data,
    this.message,
    this.total,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "total": total,
      };
}

class Data {
  String? id;
  String? user;
  List<Item>? items;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.user,
    this.items,
    this.createdAt,
    this.updatedAt,
    this.v,
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
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Item {
  Product product;
  int quantity;
  String id;

  Item({
    required this.product,
    required this.quantity,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "_id": id,
      };
}

class Product {
  String id;
  String name;
  String image;
  String categoryId;
  String type;
  String size;
  int price;
  String color;
  String materialType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.type,
    required this.size,
    required this.price,
    required this.color,
    required this.materialType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        categoryId: json["category_id"],
        type: json["type"],
        size: json["size"],
        price: json["price"],
        color: json["color"],
        materialType: json["material_type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "type": type,
        "size": size,
        "price": price,
        "color": color,
        "material_type": materialType,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
