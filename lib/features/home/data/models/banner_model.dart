class BannerModel {
  final dynamic id;
  final dynamic? type;
  final String image;
  final dynamic? link;
  final String? createdAt;
  final String? updatedAt;

  BannerModel({
    required this.id,
    this.type,
    required this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      type: json['type'],
      image: json['image'],
      link: json['link'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'image': image,
      'link': link,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class BannerResponse {
  final List<BannerModel> data;

  BannerResponse({
    required this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<BannerModel> dataList =
        list.map((i) => BannerModel.fromJson(i)).toList();

    return BannerResponse(
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
