class CategoryDetailsModel {
  int currentPage;
  List<CategoryDetails> data;
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

  CategoryDetailsModel({
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

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      currentPage: json['current_page'],
      data: List<CategoryDetails>.from(
          json['data'].map((item) => CategoryDetails.fromJson(item))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List<Link>.from(json['links'].map((item) => Link.fromJson(item))),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  void addData(CategoryDetailsModel newData) {
    data.addAll(newData.data);
    currentPage = newData.currentPage;
    nextPageUrl = newData.nextPageUrl;
    prevPageUrl = newData.prevPageUrl;
    to = newData.to;
    total = newData.total;
  }
}
class CategoryDetails {
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
  String? sub;
  Type type;

  CategoryDetails({
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

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return CategoryDetails(
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
      label: json['label'],
      active: json['active'],
    );
  }
}