class Products {
  List<Datum> data;
  String message;
  int total;

  Products({
    required this.data,
    required this.message,
    required this.total,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      message: json['message'],
      total: json['total'],
    );
  }
}

class Datum {
  String id;
  String name;
  String image;
  String categoryId;
  String type;
  String size;
  int price;
  String color;
  String materialType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.type,
    required this.size,
    required this.price,
    required this.color,
    required this.materialType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      categoryId: json['category_id'],
      type: json['type'],
      size: json['size'],
      price: json['price'],
      color: json['color'],
      materialType: json['material_type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
