class BestDeals {
  List<Datum> data;
  String message;
  int total;

  BestDeals({
    required this.data,
    required this.message,
    required this.total,
  });

  factory BestDeals.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    final List<Datum> data = dataList.map((e) => Datum.fromJson(e)).toList();

    return BestDeals(
      data: data,
      message: json['message'],
      total: json['total'],
    );
  }
}

class Datum {
  String id;
  ProductId productId;
  int discountPercentage;
  DateTime startDate;
  DateTime endDate;
  int v;
  String? image;

  Datum({
    required this.id,
    required this.productId,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.v,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['_id'],
      productId: ProductId.fromJson(json['product_id']),
      discountPercentage: json['discountPercentage'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      v: json['__v'],
      image: json['image'],
    );
  }
}

class ProductId {
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

  ProductId({
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

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
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
