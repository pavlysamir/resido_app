class CompoundDetailsModel {
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
  final String? nameEn;
  final String? nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? name;
  final String? description;
  final List<ImageCompound> imageCompound;
  final Zone zone;
  final List<PaymentPlanCompound> paymentPlanCompound;
  final List<Apartment> apartments;
  final List<MasterPlanCompound> masterPlanCompound;
  final List<FloorPlanCompound> floorPlanCompound;
  final List<ModelCompound> modelCompound;

  CompoundDetailsModel({
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
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.name,
    this.description,
    required this.imageCompound,
    required this.zone,
    required this.paymentPlanCompound,
    required this.apartments,
    required this.masterPlanCompound,
    required this.floorPlanCompound,
    required this.modelCompound,
  });

  factory CompoundDetailsModel.fromJson(Map<String, dynamic> json) {
    return CompoundDetailsModel(
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
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      name: json['name'],
      description: json['description'],
      imageCompound: (json['imagecompound'] as List)
          .map((e) => ImageCompound.fromJson(e))
          .toList(),
      zone: Zone.fromJson(json['zone']),
      paymentPlanCompound: (json['paymentplancompound'] as List)
          .map((e) => PaymentPlanCompound.fromJson(e))
          .toList(),
      apartments: (json['apartments'] as List)
          .map((e) => Apartment.fromJson(e))
          .toList(),
      masterPlanCompound: (json['masterplancompound'] as List)
          .map((e) => MasterPlanCompound.fromJson(e))
          .toList(),
      floorPlanCompound: (json['floorplancompound'] as List)
          .map((e) => FloorPlanCompound.fromJson(e))
          .toList(),
      modelCompound: (json['modelcompound'] as List)
          .map((e) => ModelCompound.fromJson(e))
          .toList(),
    );
  }
}

class ImageCompound {
  final int id;
  final String image;
  final int compoundId;

  ImageCompound({
    required this.id,
    required this.image,
    required this.compoundId,
  });

  factory ImageCompound.fromJson(Map<String, dynamic> json) {
    return ImageCompound(
      id: json['id'],
      image: json['image'],
      compoundId: json['compound_id'],
    );
  }
}

class Zone {
  final int id;
  final String name;

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

class PaymentPlanCompound {
  final int id;
  final int rate;
  final int yearlyRate;
  final int compoundId;

  PaymentPlanCompound({
    required this.id,
    required this.rate,
    required this.yearlyRate,
    required this.compoundId,
  });

  factory PaymentPlanCompound.fromJson(Map<String, dynamic> json) {
    return PaymentPlanCompound(
      id: json['id'],
      rate: json['rate'],
      yearlyRate: json['yearly_rate'],
      compoundId: json['compound_id'],
    );
  }
}

class Apartment {
  final int id;
  final String image;
  final int area;
  final int availability;
  final String priceFrom;
  final String priceTo;
  final int rooms;
  final String name;
  final String description;
  final String address;

  Apartment({
    required this.id,
    required this.image,
    required this.area,
    required this.availability,
    required this.priceFrom,
    required this.priceTo,
    required this.rooms,
    required this.name,
    required this.description,
    required this.address,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      id: json['id'],
      image: json['image'],
      area: json['area'],
      availability: json['availability'],
      priceFrom: json['price_from'],
      priceTo: json['price_to'],
      rooms: json['rooms'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
    );
  }
}

class MasterPlanCompound {
  final int id;
  final String image;
  final int compoundId;

  MasterPlanCompound({
    required this.id,
    required this.image,
    required this.compoundId,
  });

  factory MasterPlanCompound.fromJson(Map<String, dynamic> json) {
    return MasterPlanCompound(
      id: json['id'],
      image: json['image'],
      compoundId: json['compound_id'],
    );
  }
}

class FloorPlanCompound {
  final int id;
  final String image;
  final int compoundId;

  FloorPlanCompound({
    required this.id,
    required this.image,
    required this.compoundId,
  });

  factory FloorPlanCompound.fromJson(Map<String, dynamic> json) {
    return FloorPlanCompound(
      id: json['id'],
      image: json['image'],
      compoundId: json['compound_id'],
    );
  }
}

class ModelCompound {
  final int id;
  final String name;
  final int compoundId;

  ModelCompound({
    required this.id,
    required this.name,
    required this.compoundId,
  });

  factory ModelCompound.fromJson(Map<String, dynamic> json) {
    return ModelCompound(
      id: json['id'],
      name: json['name'],
      compoundId: json['compound_id'],
    );
  }
}
