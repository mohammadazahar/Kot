
class CommunityTopicsResponse {
  final List<CommunityTopic> data;
  final String message;
  final int total;

  CommunityTopicsResponse({
    required this.data,
    required this.message,
    required this.total,
  });

  factory CommunityTopicsResponse.fromJson(Map<String, dynamic> json) =>
      CommunityTopicsResponse(
        data: List<CommunityTopic>.from(
          json['data'].map((x) => CommunityTopic.fromJson(x)),
        ),
        message: json['message'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
    'message': message,
    'total': total,
  };
}

class CommunityTopic {
  final String id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int v;

  CommunityTopic({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CommunityTopic.fromJson(Map<String, dynamic> json) => CommunityTopic(
    id: json['_doc']['_id'],
    name: json['_doc']['name'],
    description: json['_doc']['description'],
    createdAt: json['_doc']['createdAt'],
    updatedAt: json['_doc']['updatedAt'],
    v: json['_doc']['__v'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'description': description,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}
