// models/select_category_model.dart

class SelectCategory {
  List<Datum> data;
  String message;
  int total;

  SelectCategory({
    required this.data,
    required this.message,
    required this.total,
  });

  factory SelectCategory.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    final List<Datum> data =
        dataList.map((item) => Datum.fromJson(item)).toList();

    return SelectCategory(
      data: data,
      message: json['message'],
      total: json['total'],
    );
  }
}

class Datum {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? image;

  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['_id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      image: json['image'],
    );
  }
}
