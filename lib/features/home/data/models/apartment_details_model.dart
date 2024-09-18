class ApartmentDaetails {
  dynamic id;
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
  dynamic statusId;
  dynamic typeId;
  dynamic compoundId;
  dynamic userId;
  dynamic subId;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String description;
  String address;
  SubCategory sub;
  Type type;
  Status status;
  Compound compound;
  List<dynamic> outdoor;
  List<dynamic> images;

  ApartmentDaetails({
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
    required this.title,
    required this.description,
    required this.address,
    required this.sub,
    required this.type,
    required this.status,
    required this.compound,
    required this.outdoor,
    required this.images,
  });

  factory ApartmentDaetails.fromJson(Map<String, dynamic> json) {
    return ApartmentDaetails(
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
      status: Status.fromJson(json['status']),
      compound: Compound.fromJson(json['compound']),
      outdoor: List<dynamic>.from(json['outdoor']),
      images: List<dynamic>.from(json['images']),
    );
  }
}

class SubCategory {
  dynamic id;
  String? image;
  dynamic catId;
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
  dynamic id;
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

class Status {
  dynamic id;
  String title;

  Status({
    required this.id,
    required this.title,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Compound {
  dynamic id;
  String image;
  String priceMin;
  String priceMax;
  String areaMin;
  String areaMax;
  dynamic zoneId;
  dynamic userId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String description;
  String address;

  Compound({
    required this.id,
    required this.image,
    required this.priceMin,
    required this.priceMax,
    required this.areaMin,
    required this.areaMax,
    required this.zoneId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.address,
  });

  factory Compound.fromJson(Map<String, dynamic> json) {
    return Compound(
      id: json['id'],
      image: json['image'],
      priceMin: json['price_min'],
      priceMax: json['price_max'],
      areaMin: json['area_min'],
      areaMax: json['area_max'],
      zoneId: json['zone_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      description: json['description'],
      address: json['address'],
    );
  }
}
