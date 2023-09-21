// To parse this JSON data, do
//
//     final categoryApiResponseModel = categoryApiResponseModelFromJson(jsonString);

import 'dart:convert';

CategoryApiResponseModel categoryApiResponseModelFromJson(String str) => CategoryApiResponseModel.fromJson(json.decode(str));

String categoryApiResponseModelToJson(CategoryApiResponseModel data) => json.encode(data.toJson());

class CategoryApiResponseModel {
  List<CategoryDatum>? data;
  String? message;
  int? total;

  CategoryApiResponseModel({
    this.data,
    this.message,
    this.total,
  });

  factory CategoryApiResponseModel.fromJson(Map<String, dynamic> json) => CategoryApiResponseModel(
    data: json["data"] == null ? [] : List<CategoryDatum>.from(json["data"]!.map((x) => CategoryDatum.fromJson(x))),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "total": total,
  };
}

class CategoryDatum {
  String? id;
  String? name;
  String? image;
  CategoryId? categoryId;
  Type? type;
  Size? size;
  int? price;
  Color? color;
  MaterialType? materialType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Deal>? deals;

  CategoryDatum({
    this.id,
    this.name,
    this.image,
    this.categoryId,
    this.type,
    this.size,
    this.price,
    this.color,
    this.materialType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deals,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    categoryId: categoryIdValues.map[json["category_id"]]!,
    type: typeValues.map[json["type"]]!,
    size: sizeValues.map[json["size"]]!,
    price: json["price"],
    color: colorValues.map[json["color"]]!,
    materialType: materialTypeValues.map[json["material_type"]]!,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    deals: json["deals"] == null ? [] : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "category_id": categoryIdValues.reverse[categoryId],
    "type": typeValues.reverse[type],
    "size": sizeValues.reverse[size],
    "price": price,
    "color": colorValues.reverse[color],
    "material_type": materialTypeValues.reverse[materialType],
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x.toJson())),
  };
}

enum CategoryId {
  THE_64_DFA81_D0_A5_EEB754010_A880
}

final categoryIdValues = EnumValues({
  "64dfa81d0a5eeb754010a880": CategoryId.THE_64_DFA81_D0_A5_EEB754010_A880
});

enum Color {
  BLUE
}

final colorValues = EnumValues({
  "blue": Color.BLUE
});

class Deal {
  String? id;
  ProductId? productId;
  int? discountPercentage;
  DateTime? startDate;
  DateTime? endDate;
  int? v;

  Deal({
    this.id,
    this.productId,
    this.discountPercentage,
    this.startDate,
    this.endDate,
    this.v,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
    id: json["_id"],
    productId: productIdValues.map[json["product_id"]]!,
    discountPercentage: json["discountPercentage"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_id": productIdValues.reverse[productId],
    "discountPercentage": discountPercentage,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "__v": v,
  };
}

enum ProductId {
  THE_64_DFBA9057454_CD7977_B4770,
  THE_64_DFBAFF9_B7_E30_B9_F1483948,
  THE_64_DFBB089_B7_E30_B9_F148394_C
}

final productIdValues = EnumValues({
  "64dfba9057454cd7977b4770": ProductId.THE_64_DFBA9057454_CD7977_B4770,
  "64dfbaff9b7e30b9f1483948": ProductId.THE_64_DFBAFF9_B7_E30_B9_F1483948,
  "64dfbb089b7e30b9f148394c": ProductId.THE_64_DFBB089_B7_E30_B9_F148394_C
});

enum MaterialType {
  POLYESTER
}

final materialTypeValues = EnumValues({
  "polyester": MaterialType.POLYESTER
});

enum Size {
  L
}

final sizeValues = EnumValues({
  "l": Size.L
});

enum Type {
  PRODUCT
}

final typeValues = EnumValues({
  "product": Type.PRODUCT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
