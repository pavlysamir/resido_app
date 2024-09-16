class MostLikeModel {
  final List<Data> data;
  final String message;
  final bool status;

  MostLikeModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory MostLikeModel.fromJson(Map<String, dynamic> json) {
    return MostLikeModel(
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
      'message': message,
      'status': status,
    };
  }
}
class Data {
  final int id;
  final String image;
  final int area;
  final int availability;
  final String priceFrom;
  final String priceTo;
  final int rooms;
  final int masterBedroom;
  final int bathrooms;
  final int bedrooms;
  final int kitchens;
  final int balconies;
  final int parksAndGarden;
  final int schools;
  final int clubhouse;
  final int commercialStrip;
  final int businessHub;
  final int mosque;
  final int sportsClubs;
  final int bicyclesLanes;
  final int medicalCenter;
  final int disabilitySupport;
  final int wifi;
  final int gym;
  final int swimmingPool;
  final int grage;
  final int basketball;
  final int tennis;
  final int laundry;
  final int likey;
  final int likes;
  final String deliveryIn;
  final int featured;
  final int garden;
  final int wellnessFacilities;
  final int transportation;
  final int waterFeatures;
  final int cafes;
  final int restaurant;
  final int cctv;
  final int security;
  final int subId;
  final int categoryId;
  final int userId;
  final int statusId;
  final int views;
  final int compoundId;
  final int modelId;
  final int typeId;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String description;
  final String address;
  final PropertyType type;
  final SubCategory sub;
  final PropertyModel model;
  final PropertyStatus status;
  final Compound compound;

  Data({
    required this.id,
    required this.image,
    required this.area,
    required this.availability,
    required this.priceFrom,
    required this.priceTo,
    required this.rooms,
    required this.masterBedroom,
    required this.bathrooms,
    required this.bedrooms,
    required this.kitchens,
    required this.balconies,
    required this.parksAndGarden,
    required this.schools,
    required this.clubhouse,
    required this.commercialStrip,
    required this.businessHub,
    required this.mosque,
    required this.sportsClubs,
    required this.bicyclesLanes,
    required this.medicalCenter,
    required this.disabilitySupport,
    required this.wifi,
    required this.gym,
    required this.swimmingPool,
    required this.grage,
    required this.basketball,
    required this.tennis,
    required this.laundry,
    required this.likey,
    required this.likes,
    required this.deliveryIn,
    required this.featured,
    required this.garden,
    required this.wellnessFacilities,
    required this.transportation,
    required this.waterFeatures,
    required this.cafes,
    required this.restaurant,
    required this.cctv,
    required this.security,
    required this.subId,
    required this.categoryId,
    required this.userId,
    required this.statusId,
    required this.views,
    required this.compoundId,
    required this.modelId,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.address,
    required this.type,
    required this.sub,
    required this.model,
    required this.status,
    required this.compound,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      image: json['image'],
      area: json['area'],
      availability: json['availability'],
      priceFrom: json['price_from'],
      priceTo: json['price_to'],
      rooms: json['rooms'],
      masterBedroom: json['master_bedroom'],
      bathrooms: json['bathrooms'],
      bedrooms: json['bedrooms'],
      kitchens: json['kitchens'],
      balconies: json['balconies'],
      parksAndGarden: json['parks_and_garden'],
      schools: json['schools'],
      clubhouse: json['clubhouse'],
      commercialStrip: json['commercial_strip'],
      businessHub: json['business_hub'],
      mosque: json['mosque'],
      sportsClubs: json['sports_clubs'],
      bicyclesLanes: json['bicycles_lanes'],
      medicalCenter: json['medical_center'],
      disabilitySupport: json['disability_support'],
      wifi: json['wifi'],
      gym: json['gym'],
      swimmingPool: json['swimming_pool'],
      grage: json['grage'],
      basketball: json['basketball'],
      tennis: json['tennis'],
      laundry: json['laundry'],
      likey: json['likey'],
      likes: json['likes'],
      deliveryIn: json['delivery_in'],
      featured: json['featured'],
      garden: json['garden'],
      wellnessFacilities: json['wellness_facilities'],
      transportation: json['transportation'],
      waterFeatures: json['water_features'],
      cafes: json['cafes'],
      restaurant: json['restaurant'],
      cctv: json['cctv'],
      security: json['security'],
      subId: json['sub_id'],
      categoryId: json['category_id'],
      userId: json['user_id'],
      statusId: json['status_id'],
      views: json['views'],
      compoundId: json['compound_id'],
      modelId: json['model_id'],
      typeId: json['type_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      type: PropertyType.fromJson(json['type']),
      sub: SubCategory.fromJson(json['sub']),
      model: PropertyModel.fromJson(json['model']),
      status: PropertyStatus.fromJson(json['status']),
      compound: Compound.fromJson(json['compound']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'area': area,
      'availability': availability,
      'price_from': priceFrom,
      'price_to': priceTo,
      'rooms': rooms,
      'master_bedroom': masterBedroom,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'kitchens': kitchens,
      'balconies': balconies,
      'parks_and_garden': parksAndGarden,
      'schools': schools,
      'clubhouse': clubhouse,
      'commercial_strip': commercialStrip,
      'business_hub': businessHub,
      'mosque': mosque,
      'sports_clubs': sportsClubs,
      'bicycles_lanes': bicyclesLanes,
      'medical_center': medicalCenter,
      'disability_support': disabilitySupport,
      'wifi': wifi,
      'gym': gym,
      'swimming_pool': swimmingPool,
      'grage': grage,
      'basketball': basketball,
      'tennis': tennis,
      'laundry': laundry,
      'likey': likey,
      'likes': likes,
      'delivery_in': deliveryIn,
      'featured': featured,
      'garden': garden,
      'wellness_facilities': wellnessFacilities,
      'transportation': transportation,
      'water_features': waterFeatures,
      'cafes': cafes,
      'restaurant': restaurant,
      'cctv': cctv,
      'security': security,
      'sub_id': subId,
      'category_id': categoryId,
      'user_id': userId,
      'status_id': statusId,
      'views': views,
      'compound_id': compoundId,
      'model_id': modelId,
      'type_id': typeId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'description': description,
      'address': address,
      'type': type.toJson(),
      'sub': sub.toJson(),
      'model': model.toJson(),
      'status': status.toJson(),
      'compound': compound.toJson(),
    };
  }
}
class PropertyType {
  final int id;
  final String name;

  PropertyType({
    required this.id,
    required this.name,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}class SubCategory {
  final int id;
  final String image;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String name;

  SubCategory({
    required this.id,
    required this.image,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      image: json['image'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
    };
  }
}class PropertyModel {
  final int id;
  final String name;
  final int compoundId;
  final String createdAt;
  final String updatedAt;

  PropertyModel({
    required this.id,
    required this.name,
    required this.compoundId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      name: json['name'],
      compoundId: json['compound_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'compound_id': compoundId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}class PropertyStatus {
  final int id;
  final String name;

  PropertyStatus({
    required this.id,
    required this.name,
  });

  factory PropertyStatus.fromJson(Map<String, dynamic> json) {
    return PropertyStatus(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}class Compound {
  final int id;
  final String image;
  final String priceFrom;
  final String priceTo;
  final String area;
  final int userId;
  final int zoneId;
  final int numberOfUnits;
  final int status;
  final int views;
  final String? name;
  final String? description;

  Compound({
    required this.id,
    required this.image,
    required this.priceFrom,
    required this.priceTo,
    required this.area,
    required this.userId,
    required this.zoneId,
    required this.numberOfUnits,
    required this.status,
    required this.views,
    this.name,
    this.description,
  });

  factory Compound.fromJson(Map<String, dynamic> json) {
    return Compound(
      id: json['id'],
      image: json['image'],
      priceFrom: json['price_from'],
      priceTo: json['price_to'],
      area: json['area'],
      userId: json['user_id'],
      zoneId: json['zone_id'],
      numberOfUnits: json['number_of_units'],
      status: json['status'],
      views: json['views'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'price_from': priceFrom,
      'price_to': priceTo,
      'area': area,
      'user_id': userId,
      'zone_id': zoneId,
      'number_of_units': numberOfUnits,
      'status': status,
      'views': views,
      'name': name,
      'description': description,
    };
  }
}