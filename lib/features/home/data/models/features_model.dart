class FeatureProperty {
  final int id;
  final int compoundId;
  final String? image;
  final String? floor;
  final int modelId;
  final String? area;
  final String availability;
  final String priceFrom;
  final String priceTo;
  final String weightFrom;
  final String weightTo;
  final String? balcony;
  final String? rooms;
  final String? masterBedroom;
  final String? bathrooms;
  final String? kitchens;
  final String? balconies;
  final int parksAndGarden;
  final int airConditioning;
  final int wifi;
  final int gym;
  final int swimmingPool;
  final int grage;
  final int basketball;
  final int tennis;
  final int likey;
  final String likes;
  final String? deliveryIn;
  final int featured;
  final int garden;
  final int wellnessFacilities;
  final int transportation;
  final int waterFeatures;
  final int cafes;
  final int restaurant;
  final int cctv;
  final int parking;
  final String? floors;
  final int statusId;
  final int typeId;
  final int subCategoryId;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String description;
  final String address;
  final String? sub;
  final Type type;

  FeatureProperty({
    required this.id,
    required this.compoundId,
    this.image,
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
    required this.type,
  });

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
      type: Type.fromJson(json['type']),
    );
  }
}

class Type {
  final int id;
  final String name;

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
}
