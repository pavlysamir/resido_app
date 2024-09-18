class DataItemCategory {
  final int id;
  final String name;
  final String image;

  DataItemCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataItemCategory.fromJson(Map<String, dynamic> json) {
    return DataItemCategory(
      id: json['id'],
      name: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'image': image,
    };
  }
}

class DataCategoryResponse {
  final List<DataItemCategory> data;

  DataCategoryResponse({
    required this.data,
  });

  factory DataCategoryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataItemCategory> dataList =
        list.map((i) => DataItemCategory.fromJson(i)).toList();

    return DataCategoryResponse(
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
