class PropertyDetailsModel {
  final int id;
  final String name;
  final String price;
  final String address;
  final String image;
  final int featured;
  final String category;
  final String type;
  final dynamic like;

  PropertyDetailsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.address,
    required this.image,
    required this.featured,
    required this.category,
    required this.type,
    required this.like,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      address: json['address'],
      image: json['image'],
      featured: json['featured'],
      category: json['category'],
      type: json['type'],
      like: json['like'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'address': address,
      'image': image,
      'featured': featured,
      'category': category,
      'type': type,
      'like': like,
    };
  }
}

class UnitDataModel {
  final List<PropertyDetailsModel> data;

  UnitDataModel({required this.data});

  factory UnitDataModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PropertyDetailsModel> propertiesList = list
        .map((propertyJson) => PropertyDetailsModel.fromJson(propertyJson))
        .toList();

    return UnitDataModel(data: propertiesList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((property) => property.toJson()).toList(),
    };
  }
}
