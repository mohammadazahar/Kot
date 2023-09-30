import 'dart:convert';

AddAddress addAddressFromJson(String str) =>
    AddAddress.fromJson(json.decode(str));

String addAddressToJson(AddAddress data) => json.encode(data.toJson());

class AddAddress {
  Data data;
  String message;
  int total;

  AddAddress({
    required this.data,
    required this.message,
    required this.total,
  });

  factory AddAddress.fromJson(Map<String, dynamic> json) => AddAddress(
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
  String user;
  String fullName;
  String streetAddress;
  String city;
  String state;
  String postalCode;
  String country;
  String id;
  int v;

  Data({
    required this.user,
    required this.fullName,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.id,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"],
        fullName: json["fullName"],
        streetAddress: json["streetAddress"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "fullName": fullName,
        "streetAddress": streetAddress,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "_id": id,
        "__v": v,
      };
}
