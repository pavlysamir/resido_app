class CategoryFilterModel {
  int currentPage;
  List<CategoryData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
  int total;

  CategoryFilterModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory CategoryFilterModel.fromJson(Map<String, dynamic> json) {
    return CategoryFilterModel(
      currentPage: json['current_page'] ?? 0,
      data: List<CategoryData>.from(
          json['data'].map((item) => CategoryData.fromJson(item))),
      firstPageUrl: json['first_page_url'] ?? '',
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      links: List<Link>.from(json['links'].map((item) => Link.fromJson(item))),
      nextPageUrl: json['next_page_url'],
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class CategoryData {
  int id;
  int compoundId;
  String? image;
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

  CategoryData({
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
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] ?? 0,
      compoundId: json['compound_id'] ?? 0,
      image: json['image'],
      floor: json['floor'],
      modelId: json['model_id'] ?? 0,
      area: json['area'],
      availability: json['availability'] ?? '',
      priceFrom: json['price_from'] ?? '',
      priceTo: json['price_to'] ?? '',
      weightFrom: json['weight_from'] ?? '',
      weightTo: json['weight_to'] ?? '',
      balcony: json['balcony'],
      rooms: json['rooms'],
      masterBedroom: json['master_bedroom'],
      bathrooms: json['bathrooms'],
      kitchens: json['kitchens'],
      balconies: json['balconies'],
      parksAndGarden: json['parks_and_garden'] ?? 0,
      airConditioning: json['air_conditioning'] ?? 0,
      wifi: json['wifi'] ?? 0,
      gym: json['gym'] ?? 0,
      swimmingPool: json['swimming_pool'] ?? 0,
      grage: json['grage'] ?? 0,
      basketball: json['basketball'] ?? 0,
      tennis: json['tennis'] ?? 0,
      likey: json['likey'] ?? 0,
      likes: json['likes'] ?? '',
      deliveryIn: json['delivery_in'],
      featured: json['featured'] ?? 0,
      garden: json['garden'] ?? 0,
      wellnessFacilities: json['wellness_facilities'] ?? 0,
      transportation: json['transportation'] ?? 0,
      waterFeatures: json['water_features'] ?? 0,
      cafes: json['cafes'] ?? 0,
      restaurant: json['restaurant'] ?? 0,
      cctv: json['cctv'] ?? 0,
      parking: json['parking'] ?? 0,
      floors: json['floors'],
      statusId: json['status_id'] ?? 0,
      typeId: json['type_id'] ?? 0,
      subCategoryId: json['sub_category_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'] ?? '',
      active: json['active'] ?? false,
    );
  }
}