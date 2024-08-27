class FeatureProperty {
  final int id;
  final String name;
  final String image;
  final String price;
  final String type;
  final String address;
  final int featured;
  final String category;
  final bool like;

  FeatureProperty({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.address,
    required this.featured,
    required this.category,
    required this.like,
  });

  factory FeatureProperty.fromJson(Map<String, dynamic> json) {
    return FeatureProperty(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      type: json['type'],
      address: json['address'],
      featured: json['featured'],
      category: json['category'],
      like: json['like'],
    );
  }
}

class FeaturePropertyList {
  final List<FeatureProperty> properties;

  FeaturePropertyList({required this.properties});

  factory FeaturePropertyList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<FeatureProperty> propertyList =
        list.map((i) => FeatureProperty.fromJson(i)).toList();

    return FeaturePropertyList(properties: propertyList);
  }
}
