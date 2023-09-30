class DailyDeals {
  List<Datum> data;
  String message;

  DailyDeals({
    required this.data,
    required this.message,
  });

  factory DailyDeals.fromJson(Map<String, dynamic> json) {
    return DailyDeals(
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      message: json["message"],
    );
  }
}

class Datum {
  String id;
  String categoryName;
  List<String> image;

  Datum({
    required this.id,
    required this.categoryName,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    List<String> imageList;
    dynamic images = json['image'];

    if (images is List) {
      imageList = List<String>.from(images);
    } else if (images is String) {
      imageList = [images];
    } else {
      imageList = [];
    }

    return Datum(
      id: json['id'],
      categoryName: json['categoryName'],
      image: imageList,
    );
  }
}
