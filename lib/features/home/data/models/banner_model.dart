class BannerModel {
  final int id;
  final String? title;
  final String image;
  final String? link;
  final String? createdAt;
  final String? updatedAt;

  BannerModel({
    required this.id,
    this.title,
    required this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      link: json['link'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
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
