class BookBoatByDateRangeResponse {
  Data? data;
  String? message;
  int? total;

  BookBoatByDateRangeResponse({this.data, this.message, this.total});

  BookBoatByDateRangeResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? user;
  String? boat;
  String? from;
  String? to;
  int? bookingStatus;
  int? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.user,
        this.boat,
        this.from,
        this.to,
        this.bookingStatus,
        this.status,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    boat = json['boat'];
    from = json['from'];
    to = json['to'];
    bookingStatus = json['bookingStatus'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['boat'] = this.boat;
    data['from'] = this.from;
    data['to'] = this.to;
    data['bookingStatus'] = this.bookingStatus;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
