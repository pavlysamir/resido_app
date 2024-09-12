class CompoundModel {
  int id;
  String? image;
  String priceMin;
  String priceMax;
  String areaMin;
  String areaMax;
  int zoneId;
  int userId;
  String createdAt;
  String updatedAt;
  String name;
  String description;
  String address;

  CompoundModel({
    required this.id,
    this.image,
    required this.priceMin,
    required this.priceMax,
    required this.areaMin,
    required this.areaMax,
    required this.zoneId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.address,
  });

  factory CompoundModel.fromJson(Map<String, dynamic> json) {
    return CompoundModel(
      id: json['id'],
      image: json['image'],
      priceMin: json['price_min'],
      priceMax: json['price_max'],
      areaMin: json['area_min'],
      areaMax: json['area_max'],
      zoneId: json['zone_id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
    );
  }
}
