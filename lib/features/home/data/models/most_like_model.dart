class MostLikeModel {
  List<Data> data;

  MostLikeModel({required this.data});

  factory MostLikeModel.fromJson(Map<String, dynamic> json) {
    return MostLikeModel(
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Data {
  int id;
  int compoundId;
  String image;
  String price;
  String bedrooms;
  String bathrooms;
  String area;
  String featured;
  int likey;
  dynamic deliveryIn;
  String longitude;
  String latitude;
  String balconies;
  String likes;
  String grage;
  int statusId;
  int typeId;
  int userId;
  int subId;
  String createdAt;
  String updatedAt;
  String title;
  String description;
  String address;
  Sub sub;
  Type type;

  Data({
    required this.id,
    required this.compoundId,
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
    required this.userId,
    required this.subId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.address,
    required this.sub,
    required this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      compoundId: json['compound_id'],
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
      userId: json['user_id'],
      subId: json['sub_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      sub: Sub.fromJson(json['sub']),
      type: Type.fromJson(json['type']),
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
