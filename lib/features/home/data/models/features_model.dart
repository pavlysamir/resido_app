class FeatureProperty {
  int id;
  int compoundId;
  String image;
  String? floor;
  int modelId;
  String? area;
  String availability;
  String priceFrom;
  String priceTo;
  String weightFrom;
  String weightTo;
  String? balcony;
  String? rooms;
  String? masterBedroom;
  String? bathrooms;
  String? kitchens;
  String? balconies;
  int parksAndGarden;
  int airConditioning;
  int wifi;
  int gym;
  int swimmingPool;
  int grage;
  int basketball;
  int tennis;
  int likey;
  String likes;
  String? deliveryIn;
  int featured;
  int garden;
  int wellnessFacilities;
  int transportation;
  int waterFeatures;
  int cafes;
  int restaurant;
  int cctv;
  int parking;
  String? floors;
  int statusId;
  int typeId;
  int subCategoryId;
  int categoryId;
  String createdAt;
  String updatedAt;
  String name;
  String description;
  String address;
  dynamic sub;
  List<Payment> payments;
  Type type;
  Status status;
  Compound compound;
  List<dynamic> images;
  List<dynamic> floorPlans;
  List<dynamic> masterPlans;

  FeatureProperty({
    required this.id,
    required this.compoundId,
    required this.image,
    this.floor,
    required this.modelId,
    this.area,
    required this.availability,
    required this.priceFrom,
    required this.priceTo,
    required this.weightFrom,
    required this.weightTo,
    this.balcony,
    this.rooms,
    this.masterBedroom,
    this.bathrooms,
    this.kitchens,
    this.balconies,
    required this.parksAndGarden,
    required this.airConditioning,
    required this.wifi,
    required this.gym,
    required this.swimmingPool,
    required this.grage,
    required this.basketball,
    required this.tennis,
    required this.likey,
    required this.likes,
    this.deliveryIn,
    required this.featured,
    required this.garden,
    required this.wellnessFacilities,
    required this.transportation,
    required this.waterFeatures,
    required this.cafes,
    required this.restaurant,
    required this.cctv,
    required this.parking,
    this.floors,
    required this.statusId,
    required this.typeId,
    required this.subCategoryId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.address,
    this.sub,
    required this.payments,
    required this.type,
    required this.status,
    required this.compound,
    required this.images,
    required this.floorPlans,
    required this.masterPlans,
  });

  // From JSON
  factory FeatureProperty.fromJson(Map<String, dynamic> json) {
    return FeatureProperty(
      id: json['id'],
      compoundId: json['compound_id'],
      image: json['image'],
      floor: json['floor'],
      modelId: json['model_id'],
      area: json['area'],
      availability: json['availability'],
      priceFrom: json['price_from'],
      priceTo: json['price_to'],
      weightFrom: json['weight_from'],
      weightTo: json['weight_to'],
      balcony: json['balcony'],
      rooms: json['rooms'],
      masterBedroom: json['master_bedroom'],
      bathrooms: json['bathrooms'],
      kitchens: json['kitchens'],
      balconies: json['balconies'],
      parksAndGarden: json['parks_and_garden'],
      airConditioning: json['air_conditioning'],
      wifi: json['wifi'],
      gym: json['gym'],
      swimmingPool: json['swimming_pool'],
      grage: json['grage'],
      basketball: json['basketball'],
      tennis: json['tennis'],
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
      parking: json['parking'],
      floors: json['floors'],
      statusId: json['status_id'],
      typeId: json['type_id'],
      subCategoryId: json['sub_category_id'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      sub: json['sub'],
      payments:
          (json['payments'] as List).map((i) => Payment.fromJson(i)).toList(),
      type: Type.fromJson(json['type']),
      status: Status.fromJson(json['status']),
      compound: Compound.fromJson(json['compound']),
      images: List<dynamic>.from(json['images']),
      floorPlans: List<dynamic>.from(json['floor_plans']),
      masterPlans: List<dynamic>.from(json['master_plans']),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'compound_id': compoundId,
      'image': image,
      'floor': floor,
      'model_id': modelId,
      'area': area,
      'availability': availability,
      'price_from': priceFrom,
      'price_to': priceTo,
      'weight_from': weightFrom,
      'weight_to': weightTo,
      'balcony': balcony,
      'rooms': rooms,
      'master_bedroom': masterBedroom,
      'bathrooms': bathrooms,
      'kitchens': kitchens,
      'balconies': balconies,
      'parks_and_garden': parksAndGarden,
      'air_conditioning': airConditioning,
      'wifi': wifi,
      'gym': gym,
      'swimming_pool': swimmingPool,
      'grage': grage,
      'basketball': basketball,
      'tennis': tennis,
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
      'parking': parking,
      'floors': floors,
      'status_id': statusId,
      'type_id': typeId,
      'sub_category_id': subCategoryId,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'description': description,
      'address': address,
      'sub': sub,
      'payments': payments.map((e) => e.toJson()).toList(),
      'type': type.toJson(),
      'status': status.toJson(),
      'compound': compound.toJson(),
      'images': images,
      'floor_plans': floorPlans,
      'master_plans': masterPlans,
    };
  }
}

class Payment {
  int id;
  String priceOfMonth;
  String year;
  String start;
  int apartmentId;
  String? createdAt;
  String? updatedAt;

  Payment({
    required this.id,
    required this.priceOfMonth,
    required this.year,
    required this.start,
    required this.apartmentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      priceOfMonth: json['price_of_month'],
      year: json['year'],
      start: json['start'],
      apartmentId: json['apartment_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price_of_month': priceOfMonth,
      'year': year,
      'start': start,
      'apartment_id': apartmentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Type {
  int id;
  String name;

  Type({
    required this.id,
    required this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
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
}

class Status {
  int id;
  String name;

  Status({
    required this.id,
    required this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
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
}

class Compound {
  int id;
  String image;
  String priceFrom;
  String priceTo;
  int userId;
  int zoneId;
  String numberOfUnits;
  String status;
  String views;
  String name;
  String description;

  Compound({
    required this.id,
    required this.image,
    required this.priceFrom,
    required this.priceTo,
    required this.userId,
    required this.zoneId,
    required this.numberOfUnits,
    required this.status,
    required this.views,
    required this.name,
    required this.description,
  });

  factory Compound.fromJson(Map<String, dynamic> json) {
    return Compound(
      id: json['id'],
      image: json['image'],
      priceFrom: json['price_from'],
      priceTo: json['price_to'],
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
