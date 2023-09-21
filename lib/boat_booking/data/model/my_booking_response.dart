class MyBookingResponse {
  List<MyBookingData>? data;
  String? message;
  int? total;

  MyBookingResponse({this.data, this.message, this.total});

  MyBookingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MyBookingData>[];
      json['data'].forEach((v) {
        data!.add(MyBookingData.fromJson(v));
      });
    }
    message = json['message'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['total'] = total;
    return data;
  }
}

class MyBookingData {
  String? sId;
  User? user;
  String? boat;
  String? from;
  String? to;
  int? bookingStatus;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyBookingData(
      {this.sId,
        this.user,
        this.boat,
        this.from,
        this.to,
        this.bookingStatus,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  MyBookingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    boat = json['boat'];
    from = json['from'];
    to = json['to'];
    bookingStatus = json['bookingStatus'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['boat'] = boat;
    data['from'] = from;
    data['to'] = to;
    data['bookingStatus'] = bookingStatus;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  int? status;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.status,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['status'] = status;
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
