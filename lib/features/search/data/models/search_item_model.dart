import 'dart:convert';

class SearchItemModel {
  final int currentPage;
  final List<Data> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  SearchItemModel({
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

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    return SearchItemModel(
      currentPage: json['current_page'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
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
  final Type type;
  final Sub sub;
  final Model model;
  final Status status;
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
      type: Type.fromJson(json['type']),
      sub: Sub.fromJson(json['sub']),
      model: Model.fromJson(json['model']),
      status: Status.fromJson(json['status']),
      compound: Compound.fromJson(json['compound']),
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

class Sub {
  final int id;
  final String image;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String name;

  Sub({
    required this.id,
    required this.image,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Sub.fromJson(Map<String, dynamic> json) {
    return Sub(
      id: json['id'],
      image: json['image'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
    );
  }
}

class Model {
  final int id;
  final String name;
  final int compoundId;
  final String createdAt;
  final String updatedAt;

  Model({
    required this.id,
    required this.name,
    required this.compoundId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
      compoundId: json['compound_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Status {
  final int id;
  final String name;

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
}

class Compound {
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
}

class Link {
  final String? url;
  final String label;
  final bool active;

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