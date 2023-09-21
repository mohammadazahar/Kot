class CommunityCreateResponse {
  Data? data;
  String? message;
  int? total;

  CommunityCreateResponse({this.data, this.message, this.total});

  CommunityCreateResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? name;
  String? coverPhoto;
  String? description;
  Location? location;
  List<String>? topic;
  List<String>? people;
  bool? privacy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.name,
      this.coverPhoto,
      this.description,
      this.location,
      this.topic,
      this.people,
      this.privacy,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coverPhoto = json['coverPhoto'];
    description = json['description'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    topic = json['topic'].cast<String>();
    people = json['people'].cast<String>();
    privacy = json['privacy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['coverPhoto'] = coverPhoto;
    data['description'] = description;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['topic'] = topic;
    data['people'] = people;
    data['privacy'] = privacy;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Location {
  double? lat;
  double? lng;
  String? address;

  Location({this.lat, this.lng, this.address});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['address'] = address;
    return data;
  }
}
