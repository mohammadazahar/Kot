// To parse this JSON data, do
//
//     final allDealsApiModel = allDealsApiModelFromJson(jsonString);

import 'dart:convert';

AllDealsApiModel allDealsApiModelFromJson(String str) => AllDealsApiModel.fromJson(json.decode(str));

String allDealsApiModelToJson(AllDealsApiModel data) => json.encode(data.toJson());

class AllDealsApiModel {
  List<AllDealDatumModel>? data;
  String? message;
  int? total;

  AllDealsApiModel({
    this.data,
    this.message,
    this.total,
  });

  factory AllDealsApiModel.fromJson(Map<String, dynamic> json) => AllDealsApiModel(
    data: json["data"] == null ? [] : List<AllDealDatumModel>.from(json["data"]!.map((x) => AllDealDatumModel.fromJson(x))),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "total": total,
  };
}

class AllDealDatumModel {
  String? id;
  ProductId? productId;
  int? discountPercentage;
  DateTime? startDate;
  DateTime? endDate;
  int? v;

  AllDealDatumModel({
    this.id,
    this.productId,
    this.discountPercentage,
    this.startDate,
    this.endDate,
    this.v,
  });

  factory AllDealDatumModel.fromJson(Map<String, dynamic> json) => AllDealDatumModel(
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
