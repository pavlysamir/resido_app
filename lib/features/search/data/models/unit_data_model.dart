// class PropertyDetailsModel {
//   final int id;
//   final String name;
//   final String price;
//   final String address;
//   final String image;
//   final int featured;
//   final String category;
//   final String type;
//   final dynamic like;

//   PropertyDetailsModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.address,
//     required this.image,
//     required this.featured,
//     required this.category,
//     required this.type,
//     required this.like,
//   });

//   factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
//     return PropertyDetailsModel(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//       address: json['address'],
//       image: json['image'],
//       featured: json['featured'],
//       category: json['category'],
//       type: json['type'],
//       like: json['like'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'address': address,
//       'image': image,
//       'featured': featured,
//       'category': category,
//       'type': type,
//       'like': like,
//     };
//   }
// }

// class UnitDataModel {
//   final List<PropertyDetailsModel> data;

//   UnitDataModel({required this.data});

//   factory UnitDataModel.fromJson(Map<String, dynamic> json) {
//     var list = json['data'] as List;
//     List<PropertyDetailsModel> propertiesList = list
//         .map((propertyJson) => PropertyDetailsModel.fromJson(propertyJson))
//         .toList();

//     return UnitDataModel(data: propertiesList);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.map((property) => property.toJson()).toList(),
//     };
//   }
// }

class PropertyModel {
  final int id;
  final String image;
  final String price;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final String featured;
  final int likey;
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String description;
  final String address;
  final Sub sub;
  final Type type;

  PropertyModel({
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
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
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
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'title': title,
      'description': description,
      'address': address,
      'sub': sub.toJson(),
      'type': type.toJson(),
    };
  }
}

class Sub {
  final int id;
  final String image;
  final int catId;
  final String name;

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
  final int id;
  final String title;

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

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}

class PaginatedProperties {
  final int currentPage;
  final List<PropertyModel> data;
  final String? firstPageUrl;
  final int from;
  final int lastPage;
  final String? lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  PaginatedProperties({
    required this.currentPage,
    required this.data,
    this.firstPageUrl,
    required this.from,
    required this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory PaginatedProperties.fromJson(Map<String, dynamic> json) {
    return PaginatedProperties(
      currentPage: json['current_page'],
      data: List<PropertyModel>.from(
          json['data'].map((property) => PropertyModel.fromJson(property))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List<PageLink>.from(
          json['links'].map((link) => PageLink.fromJson(link))),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': data.map((property) => property.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links.map((link) => link.toJson()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }
}
