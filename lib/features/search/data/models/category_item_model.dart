class DataItem {
  final int id;
  final String name;
  final String image;

  DataItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
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
  final List<DataItem> data;

  DataCategoryResponse({
    required this.data,
  });

  factory DataCategoryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataItem> dataList = list.map((i) => DataItem.fromJson(i)).toList();

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
