class CompoundModel {
  Compound data;

  CompoundModel({required this.data});

  factory CompoundModel.fromJson(Map<String, dynamic> json) {
    return CompoundModel(
      data: Compound.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
class Translation {
  int id;
  String name;
  String address;
  String description;
  int compoundId;
  String locale;
  String? createdAt;
  String? updatedAt;

  Translation({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.compoundId,
    required this.locale,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      compoundId: json['compound_id'],
      locale: json['locale'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'compound_id': compoundId,
      'locale': locale,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
class Image {
  int id;
  int compoundId;
  String image;

  Image({
    required this.id,
    required this.compoundId,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      compoundId: json['compound_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'compound_id': compoundId,
      'image': image,
    };
  }
}
class Compound {
  int id;
  String image;
  String priceMin;
  String priceMax;
  String areaMin;
  String areaMax;
  int zoneId;
  int userId;
  String createdAt;
  String updatedAt;
  String nameAr;
  String nameEn;
  String addressEn;
  String addressAr;
  String descriptionAr;
  String descriptionEn;
  String name;
  String description;
  String address;
  List<Image> images;
  List<Translation> translations;

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
    required this.nameAr,
    required this.nameEn,
    required this.addressEn,
    required this.addressAr,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.name,
    required this.description,
    required this.address,
    required this.images,
    required this.translations,
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      addressEn: json['address_en'],
      addressAr: json['address_ar'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      images: (json['images'] as List).map((i) => Image.fromJson(i)).toList(),
      translations: (json['translations'] as List).map((t) => Translation.fromJson(t)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'price_min': priceMin,
      'price_max': priceMax,
      'area_min': areaMin,
      'area_max': areaMax,
      'zone_id': zoneId,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name_ar': nameAr,
      'name_en': nameEn,
      'address_en': addressEn,
      'address_ar': addressAr,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'name': name,
      'description': description,
      'address': address,
      'images': images.map((i) => i.toJson()).toList(),
      'translations': translations.map((t) => t.toJson()).toList(),
    };
  }
}
