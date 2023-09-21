class BoatSearchResponse {
  // List<Data>? data;
  String? message;
  int? total;

  BoatSearchResponse(
      {
      //this.data,
      this.message,
      this.total});

  BoatSearchResponse.fromJson(Map<String, dynamic> json) {
    // if (json['data'] != null) {
    //   data = <Data>[];
    //   json['data'].forEach((v) {
    //     data!.add(new Data.fromJson(v));
    //   });
    // }
    message = json['message'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    data['message'] = message;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  List<String>? image;
  String? boatType;
  int? pricePerDay;
  int? length;
  int? cabins;
  int? capacity;
  int? birth;
  int? kitchen;
  int? bathroom;
  bool? shower;
  int? motorPower;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? hasCaptain;
  bool? superOwner;
  String? location;
  String? description;
  String? user;
  String? video;
  int? averageRating;
  int? bookingCount;
  int? personsRatedCount;

  Data(
      {this.sId,
      this.name,
      this.image,
      this.boatType,
      this.pricePerDay,
      this.length,
      this.cabins,
      this.capacity,
      this.birth,
      this.kitchen,
      this.bathroom,
      this.shower,
      this.motorPower,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.hasCaptain,
      this.superOwner,
      this.location,
      this.description,
      this.user,
      this.video,
      this.averageRating,
      this.bookingCount,
      this.personsRatedCount});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'].cast<String>();
    boatType = json['boatType'];
    pricePerDay = json['pricePerDay'];
    length = json['length'];
    cabins = json['cabins'];
    capacity = json['capacity'];
    birth = json['birth'];
    kitchen = json['kitchen'];
    bathroom = json['bathroom'];
    shower = json['shower'];
    motorPower = json['motorPower'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    hasCaptain = json['hasCaptain'];
    superOwner = json['superOwner'];
    location = json['location'];
    description = json['description'];
    user = json['user'];
    video = json['video'];
    averageRating = json['averageRating'];
    bookingCount = json['bookingCount'];
    personsRatedCount = json['personsRatedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['boatType'] = boatType;
    data['pricePerDay'] = pricePerDay;
    data['length'] = length;
    data['cabins'] = cabins;
    data['capacity'] = capacity;
    data['birth'] = birth;
    data['kitchen'] = kitchen;
    data['bathroom'] = bathroom;
    data['shower'] = shower;
    data['motorPower'] = motorPower;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['hasCaptain'] = hasCaptain;
    data['superOwner'] = superOwner;
    data['location'] = location;
    data['description'] = description;
    data['user'] = user;
    data['video'] = video;
    data['averageRating'] = averageRating;
    data['bookingCount'] = bookingCount;
    data['personsRatedCount'] = personsRatedCount;
    return data;
  }
}
