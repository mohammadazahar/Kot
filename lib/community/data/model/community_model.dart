class CommunityFeedResponse {
  List<CommunityFeedItem>? data;
  String? message;
  int? total;

  CommunityFeedResponse({this.data, this.message, this.total});

  CommunityFeedResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CommunityFeedItem>[];
      json['data'].forEach((v) {
        data!.add(CommunityFeedItem.fromJson(v));
      });
    }

    // Check if the 'message' field is a String, and if not, assign an empty string.
    if (json['message'] is String) {
      message = json['message'];
    } else {
      message = ''; // Assign an empty string or handle other types as needed.
    }

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

class CommunityFeedItem {
  String? sId;
  bool? isPost;
  Post? post;
  Community? community;
  String? createdAt;
  String? updatedAt;
  int? iV;
  dynamic fishCatch;

  CommunityFeedItem(
      {this.sId,
      this.isPost,
      this.post,
      this.community,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.fishCatch});

  CommunityFeedItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isPost = json['isPost'];
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
    community = json['community'] != null ? Community.fromJson(json['community']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    fishCatch = json['fishCatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['isPost'] = isPost;
    if (post != null) {
      data['post'] = post!.toJson();
    }
    if (community != null) {
      data['community'] = community!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['fishCatch'] = fishCatch;
    return data;
  }
}

class Post {
  String? sId;
  String? user;
  String? message;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<String>? likes;
  bool? isCommunityPost;

  Post(
      {this.sId,
      this.user,
      this.message,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.likes,
      this.isCommunityPost});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    message = json['message'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    likes = json['likes'].cast<String>();
    isCommunityPost = json['isCommunityPost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['message'] = message;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['likes'] = likes;
    data['isCommunityPost'] = isCommunityPost;
    return data;
  }
}

class Community {
  String? sId;
  String? name;
  String? coverPhoto;
  String? description;
  Location? location;
  bool? privacy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Community(
      {this.sId,
      this.name,
      this.coverPhoto,
      this.description,
      this.location,
      this.privacy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Community.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    coverPhoto = json['coverPhoto'];
    description = json['description'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    privacy = json['privacy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['coverPhoto'] = coverPhoto;
    data['description'] = description;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['privacy'] = privacy;
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
