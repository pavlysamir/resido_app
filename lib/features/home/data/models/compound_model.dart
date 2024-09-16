class CompoundModel {
  dynamic id;
  String? image;
  String priceFrom;
  String priceTo;
  dynamic userId;
  dynamic zoneId;
  String numberOfUnits;
  String status;
  String views;
  String name;
  String description;
  Zone zone;

  CompoundModel({
    required this.id,
    this.image,
    required this.priceFrom,
    required this.priceTo,
    required this.userId,
    required this.zoneId,
    required this.numberOfUnits,
    required this.status,
    required this.views,
    required this.name,
    required this.description,
    required this.zone,
  });

  factory CompoundModel.fromJson(Map<String, dynamic> json) {
    return CompoundModel(
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
      zone: Zone.fromJson(json['zone']),
    );
  }
}

class Zone {
  dynamic id;
  String name;

  Zone({
    required this.id,
    required this.name,
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CompoundList {
  List<CompoundModel> data;
  String message;
  bool status;

  CompoundList({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CompoundList.fromJson(Map<String, dynamic> json) {
    return CompoundList(
      data: List<CompoundModel>.from(
          json['data'].map((item) => CompoundModel.fromJson(item))),
      message: json['message'],
      status: json['status'],
    );
  }
}
