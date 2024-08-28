class FeatureProperty {
  int id;
  String image;
  String price;
  String bedrooms;
  String bathrooms;
  String area;
  String featured;
  String? deliveryIn;
  String longitude;
  String latitude;
  String balconies;
  String likes;
  String grage;
  int statusId;
  int typeId;
  int compoundId;
  int userId;
  int subId;
  DateTime createdAt;
  DateTime updatedAt;
  String? title;
  String? description;
  String? address;
  SubCategory sub;
  Type type;

  FeatureProperty({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.featured,
    this.deliveryIn,
    required this.longitude,
    required this.latitude,
    required this.balconies,
    required this.likes,
    required this.grage,
    required this.statusId,
    required this.typeId,
    required this.compoundId,
    required this.userId,
    required this.subId,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    this.description,
    this.address,
    required this.sub,
    required this.type,
  });

  factory FeatureProperty.fromJson(Map<String, dynamic> json) {
    return FeatureProperty(
      id: json['id'],
      image: json['image'],
      price: json['price'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'],
      featured: json['featured'],
      deliveryIn: json['delivery_in'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      balconies: json['balconies'],
      likes: json['likes'],
      grage: json['grage'],
      statusId: json['status_id'],
      typeId: json['type_id'],
      compoundId: json['compound_id'],
      userId: json['user_id'],
      subId: json['sub_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      title: json['title'],
      description: json['description'],
      address: json['address'],
      sub: SubCategory.fromJson(json['sub']),
      type: Type.fromJson(json['type']),
    );
  }
}

class SubCategory {
  int id;
  String? image;
  int catId;
  String name;

  SubCategory({
    required this.id,
    this.image,
    required this.catId,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      image: json['image'],
      catId: json['cat_id'],
      name: json['name'],
    );
  }
}

class Type {
  int id;
  String title;

  Type({
    required this.id,
    required this.title,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'],
      title: json['title'],
    );
  }
}
