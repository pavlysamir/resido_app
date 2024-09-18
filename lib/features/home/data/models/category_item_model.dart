class CategoryList {
  List<Category> data;
  String message;
  bool status;

  CategoryList({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      data: List<Category>.from(
          json['data'].map((item) => Category.fromJson(item))),
      message: json['message'],
      status: json['status'],
    );
  }
}

class Category {
  dynamic id;
  String? image;
  String name;

  Category({
    required this.id,
    this.image,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
