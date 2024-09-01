class DataFavoriteModel {
  final List<FavoriteData> data;

  DataFavoriteModel({required this.data});

  factory DataFavoriteModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<FavoriteData> favoriteDataList = dataList.map((i) => FavoriteData.fromJson(i)).toList();

    return DataFavoriteModel(data: favoriteDataList);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> dataToJson = data.map((i) => i.toJson()).toList();

    return {
      'data': dataToJson,
    };
  }
}

class FavoriteData {
  final int id;
  final int userId;
  final int apartmentId;
  final String createdAt;
  final String updatedAt;
  final Apartment apartment;

  FavoriteData({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.createdAt,
    required this.updatedAt,
    required this.apartment,
  });

  factory FavoriteData.fromJson(Map<String, dynamic> json) {
    return FavoriteData(
      id: json['id'],
      userId: json['user_id'],
      apartmentId: json['apartment_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      apartment: Apartment.fromJson(json['apartment']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'apartment_id': apartmentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'apartment': apartment.toJson(),
    };
  }
}
class Apartment {
  final int id;
  final String image;
  final String price;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final String featured;
  final String? deliveryIn;
  final String longitude;
  final String latitude;
  final String balconies;
  final String likes;
  final String grage;
  final int statusId;
  final int typeId;
  final int compoundId;
  final int userId;
  final int subId;
  final String createdAt;
  final String updatedAt;
  final String? title;
  final String? description;
  final String? address;
  final List<Translation> translations;

  Apartment({
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
    required this.translations,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    var translationsFromJson = json['translations'] as List;
    List<Translation> translationsList = translationsFromJson.map((i) => Translation.fromJson(i)).toList();

    return Apartment(
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      translations: translationsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> translationsToJson = translations.map((i) => i.toJson()).toList();

    return {
      'id': id,
      'image': image,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'featured': featured,
      'delivery_in': deliveryIn,
      'longitude': longitude,
      'latitude': latitude,
      'balconies': balconies,
      'likes': likes,
      'grage': grage,
      'status_id': statusId,
      'type_id': typeId,
      'compound_id': compoundId,
      'user_id': userId,
      'sub_id': subId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'title': title,
      'description': description,
      'address': address,
      'translations': translationsToJson,
    };
  }
}
class Translation {
  final int id;
  final int apartmentId;
  final String locale;
  final String title;
  final String address;
  final String description;

  Translation({
    required this.id,
    required this.apartmentId,
    required this.locale,
    required this.title,
    required this.address,
    required this.description,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      apartmentId: json['apartment_id'],
      locale: json['locale'],
      title: json['title'],
      address: json['address'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'apartment_id': apartmentId,
      'locale': locale,
      'title': title,
      'address': address,
      'description': description,
    };
  }
}