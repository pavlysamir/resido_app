class CategoryPropertiesModel {
  List<CategoryData> data;
  String message;
  bool status;

  CategoryPropertiesModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CategoryPropertiesModel.fromJson(Map<String, dynamic> json) {
    return CategoryPropertiesModel(
      data: List<CategoryData>.from(json['data'].map((item) => CategoryData.fromJson(item))),
      message: json['message'],
      status: json['status'],
    );
  }
}class CategoryData {
  int id;
  int categoryId;
  String? image;
  String name;

  CategoryData({
    required this.id,
    required this.categoryId,
    this.image,
    required this.name,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      categoryId: json['category_id'],
      image: json['image'],
      name: json['name'],
    );
  }
}