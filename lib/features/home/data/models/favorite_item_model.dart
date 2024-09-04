/// data : [{"id":24,"image":"https://ai.w-manage.org/public/images/apartments/1725373260.jfif","price":"100000","bedrooms":"12","bathrooms":"2","area":"1000","featured":"0","likey":"0","delivery_in":null,"longitude":"12","latitude":"31","balconies":"2","likes":"1","grage":"3","status_id":1,"type_id":1,"compound_id":9,"user_id":1,"sub_id":19,"created_at":"2024-09-03T14:21:00.000000Z","updated_at":"2024-09-04T13:13:53.000000Z","title":"villa","description":"desc","address":"Address","sub":{"id":19,"image":"https://ai.w-manage.org/public/images/cat/PM.jpeg","cat_id":14,"name":"sub category"},"type":{"id":1,"title":"sell"},"fava":[{"id":130,"user_id":34,"apartment_id":24,"created_at":"2024-09-04T13:13:53.000000Z","updated_at":"2024-09-04T13:13:53.000000Z"}]}]

class FavoriteItemModel {
  FavoriteItemModel({
      List<Data> data,}){
    _data = data;
}

  FavoriteItemModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }
  List<Data> _data;
FavoriteItemModel copyWith({  List<Data> data,
}) => FavoriteItemModel(  data: data ?? _data,
);
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 24
/// image : "https://ai.w-manage.org/public/images/apartments/1725373260.jfif"
/// price : "100000"
/// bedrooms : "12"
/// bathrooms : "2"
/// area : "1000"
/// featured : "0"
/// likey : "0"
/// delivery_in : null
/// longitude : "12"
/// latitude : "31"
/// balconies : "2"
/// likes : "1"
/// grage : "3"
/// status_id : 1
/// type_id : 1
/// compound_id : 9
/// user_id : 1
/// sub_id : 19
/// created_at : "2024-09-03T14:21:00.000000Z"
/// updated_at : "2024-09-04T13:13:53.000000Z"
/// title : "villa"
/// description : "desc"
/// address : "Address"
/// sub : {"id":19,"image":"https://ai.w-manage.org/public/images/cat/PM.jpeg","cat_id":14,"name":"sub category"}
/// type : {"id":1,"title":"sell"}
/// fava : [{"id":130,"user_id":34,"apartment_id":24,"created_at":"2024-09-04T13:13:53.000000Z","updated_at":"2024-09-04T13:13:53.000000Z"}]

class Data {
  Data({
      num id, 
      String image, 
      String price, 
      String bedrooms, 
      String bathrooms, 
      String area, 
      String featured, 
      String likey, 
      dynamic deliveryIn, 
      String longitude, 
      String latitude, 
      String balconies, 
      String likes, 
      String grage, 
      num statusId, 
      num typeId, 
      num compoundId, 
      num userId, 
      num subId, 
      String createdAt, 
      String updatedAt, 
      String title, 
      String description, 
      String address, 
      Sub sub, 
      Type type, 
      List<Fava> fava,}){
    _id = id;
    _image = image;
    _price = price;
    _bedrooms = bedrooms;
    _bathrooms = bathrooms;
    _area = area;
    _featured = featured;
    _likey = likey;
    _deliveryIn = deliveryIn;
    _longitude = longitude;
    _latitude = latitude;
    _balconies = balconies;
    _likes = likes;
    _grage = grage;
    _statusId = statusId;
    _typeId = typeId;
    _compoundId = compoundId;
    _userId = userId;
    _subId = subId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _description = description;
    _address = address;
    _sub = sub;
    _type = type;
    _fava = fava;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _price = json['price'];
    _bedrooms = json['bedrooms'];
    _bathrooms = json['bathrooms'];
    _area = json['area'];
    _featured = json['featured'];
    _likey = json['likey'];
    _deliveryIn = json['delivery_in'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _balconies = json['balconies'];
    _likes = json['likes'];
    _grage = json['grage'];
    _statusId = json['status_id'];
    _typeId = json['type_id'];
    _compoundId = json['compound_id'];
    _userId = json['user_id'];
    _subId = json['sub_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _description = json['description'];
    _address = json['address'];
    _sub = json['sub'] != null ? Sub.fromJson(json['sub']) : null;
    _type = json['type'] != null ? Type.fromJson(json['type']) : null;
    if (json['fava'] != null) {
      _fava = [];
      json['fava'].forEach((v) {
        _fava.add(Fava.fromJson(v));
      });
    }
  }
  num _id;
  String _image;
  String _price;
  String _bedrooms;
  String _bathrooms;
  String _area;
  String _featured;
  String _likey;
  dynamic _deliveryIn;
  String _longitude;
  String _latitude;
  String _balconies;
  String _likes;
  String _grage;
  num _statusId;
  num _typeId;
  num _compoundId;
  num _userId;
  num _subId;
  String _createdAt;
  String _updatedAt;
  String _title;
  String _description;
  String _address;
  Sub _sub;
  Type _type;
  List<Fava> _fava;
Data copyWith({  num id,
  String image,
  String price,
  String bedrooms,
  String bathrooms,
  String area,
  String featured,
  String likey,
  dynamic deliveryIn,
  String longitude,
  String latitude,
  String balconies,
  String likes,
  String grage,
  num statusId,
  num typeId,
  num compoundId,
  num userId,
  num subId,
  String createdAt,
  String updatedAt,
  String title,
  String description,
  String address,
  Sub sub,
  Type type,
  List<Fava> fava,
}) => Data(  id: id ?? _id,
  image: image ?? _image,
  price: price ?? _price,
  bedrooms: bedrooms ?? _bedrooms,
  bathrooms: bathrooms ?? _bathrooms,
  area: area ?? _area,
  featured: featured ?? _featured,
  likey: likey ?? _likey,
  deliveryIn: deliveryIn ?? _deliveryIn,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  balconies: balconies ?? _balconies,
  likes: likes ?? _likes,
  grage: grage ?? _grage,
  statusId: statusId ?? _statusId,
  typeId: typeId ?? _typeId,
  compoundId: compoundId ?? _compoundId,
  userId: userId ?? _userId,
  subId: subId ?? _subId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  title: title ?? _title,
  description: description ?? _description,
  address: address ?? _address,
  sub: sub ?? _sub,
  type: type ?? _type,
  fava: fava ?? _fava,
);
  num get id => _id;
  String get image => _image;
  String get price => _price;
  String get bedrooms => _bedrooms;
  String get bathrooms => _bathrooms;
  String get area => _area;
  String get featured => _featured;
  String get likey => _likey;
  dynamic get deliveryIn => _deliveryIn;
  String get longitude => _longitude;
  String get latitude => _latitude;
  String get balconies => _balconies;
  String get likes => _likes;
  String get grage => _grage;
  num get statusId => _statusId;
  num get typeId => _typeId;
  num get compoundId => _compoundId;
  num get userId => _userId;
  num get subId => _subId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get title => _title;
  String get description => _description;
  String get address => _address;
  Sub get sub => _sub;
  Type get type => _type;
  List<Fava> get fava => _fava;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['price'] = _price;
    map['bedrooms'] = _bedrooms;
    map['bathrooms'] = _bathrooms;
    map['area'] = _area;
    map['featured'] = _featured;
    map['likey'] = _likey;
    map['delivery_in'] = _deliveryIn;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['balconies'] = _balconies;
    map['likes'] = _likes;
    map['grage'] = _grage;
    map['status_id'] = _statusId;
    map['type_id'] = _typeId;
    map['compound_id'] = _compoundId;
    map['user_id'] = _userId;
    map['sub_id'] = _subId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['description'] = _description;
    map['address'] = _address;
    if (_sub != null) {
      map['sub'] = _sub.toJson();
    }
    if (_type != null) {
      map['type'] = _type.toJson();
    }
    if (_fava != null) {
      map['fava'] = _fava.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 130
/// user_id : 34
/// apartment_id : 24
/// created_at : "2024-09-04T13:13:53.000000Z"
/// updated_at : "2024-09-04T13:13:53.000000Z"

class Fava {
  Fava({
      num id, 
      num userId, 
      num apartmentId, 
      String createdAt, 
      String updatedAt,}){
    _id = id;
    _userId = userId;
    _apartmentId = apartmentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Fava.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _apartmentId = json['apartment_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num _id;
  num _userId;
  num _apartmentId;
  String _createdAt;
  String _updatedAt;
Fava copyWith({  num id,
  num userId,
  num apartmentId,
  String createdAt,
  String updatedAt,
}) => Fava(  id: id ?? _id,
  userId: userId ?? _userId,
  apartmentId: apartmentId ?? _apartmentId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id;
  num get userId => _userId;
  num get apartmentId => _apartmentId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['apartment_id'] = _apartmentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// title : "sell"

class Type {
  Type({
      num id, 
      String title,}){
    _id = id;
    _title = title;
}

  Type.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  num _id;
  String _title;
Type copyWith({  num id,
  String title,
}) => Type(  id: id ?? _id,
  title: title ?? _title,
);
  num get id => _id;
  String get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}

/// id : 19
/// image : "https://ai.w-manage.org/public/images/cat/PM.jpeg"
/// cat_id : 14
/// name : "sub category"

class Sub {
  Sub({
      num id, 
      String image, 
      num catId, 
      String name,}){
    _id = id;
    _image = image;
    _catId = catId;
    _name = name;
}

  Sub.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _catId = json['cat_id'];
    _name = json['name'];
  }
  num _id;
  String _image;
  num _catId;
  String _name;
Sub copyWith({  num id,
  String image,
  num catId,
  String name,
}) => Sub(  id: id ?? _id,
  image: image ?? _image,
  catId: catId ?? _catId,
  name: name ?? _name,
);
  num get id => _id;
  String get image => _image;
  num get catId => _catId;
  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['cat_id'] = _catId;
    map['name'] = _name;
    return map;
  }

}