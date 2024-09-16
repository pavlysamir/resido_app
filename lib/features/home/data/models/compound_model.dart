class CompoundModel {
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
  final String name;
  final String description;

  CompoundModel({
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
    required this.name,
    required this.description,
  });

  factory CompoundModel.fromJson(Map<String, dynamic> json) {
    return CompoundModel(
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