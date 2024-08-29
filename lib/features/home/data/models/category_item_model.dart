class CategoryList {
  List<Category> data;

  CategoryList({required this.data});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      data: List<Category>.from(
          json['data'].map((item) => Category.fromJson(item))),
    );
  }
}

class Category {
  int id;
  String image;
  String title;

  Category({
    required this.id,
    required this.image,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
