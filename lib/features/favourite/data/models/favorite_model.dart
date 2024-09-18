class FavoriteModel {
  List<Data> data;

  FavoriteModel({required this.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      data: List<Data>.from(json['data'].map((item) => Data.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((item) => item.toJson())),
    };
  }
}
class Data {
  int id;
  String image;
  String price;
  String bedrooms;
  String bathrooms;
  String area;
  String featured;
  String likey;
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
  String createdAt;
  String updatedAt;
  String title;
  String description;
  String address;
  Sub sub;
  Type type;
  List<Fava> fava;

  Data({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.featured,
    required this.likey,
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
    required this.fava,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      image: json['image'],
      price: json['price'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'],
      featured: json['featured'],
      likey: json['likey'],
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
      sub: Sub.fromJson(json['sub']),
      type: Type.fromJson(json['type']),
      fava: List<Fava>.from(json['fava'].map((item) => Fava.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'featured': featured,
      'likey': likey,
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
      'sub': sub.toJson(),
      'type': type.toJson(),
      'fava': List<dynamic>.from(fava.map((item) => item.toJson())),
    };
  }
}
class Sub {
  int id;
  String image;
  int catId;
  String name;

  Sub({
    required this.id,
    required this.image,
    required this.catId,
    required this.name,
  });

  factory Sub.fromJson(Map<String, dynamic> json) {
    return Sub(
      id: json['id'],
      image: json['image'],
      catId: json['cat_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'cat_id': catId,
      'name': name,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
class Fava {
  int id;
  int userId;
  int apartmentId;
  String createdAt;
  String updatedAt;

  Fava({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Fava.fromJson(Map<String, dynamic> json) {
    return Fava(
      id: json['id'],
      userId: json['user_id'],
      apartmentId: json['apartment_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'apartment_id': apartmentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}