class DataItem {
  final int? id;
  final String? name;
  final int? catId;
  final String? image;

  DataItem({
    required this.id,
    required this.name,
    required this.catId,
    required this.image,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'],
      catId: json['cat_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'cat_id': catId,
      'name': image,
    };
  }
}

class DataSubCategoryResponse {
  final List<DataItem> data;

  DataSubCategoryResponse({
    required this.data,
  });

  factory DataSubCategoryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataItem> dataList = list.map((i) => DataItem.fromJson(i)).toList();

    return DataSubCategoryResponse(
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
