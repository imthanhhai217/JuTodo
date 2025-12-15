import 'dart:convert';

import 'package:equatable/equatable.dart';

/// products : [{"id":1,"title":"Essence Mascara Lash Princess","description":"The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.","category":"beauty","price":9.99,"discountPercentage":10.48,"rating":2.56,"stock":99,"tags":["beauty","mascara"],"brand":"Essence","sku":"BEA-ESS-ESS-001","weight":4,"dimensions":{"width":15.14,"height":13.08,"depth":22.99},"warrantyInformation":"1 week warranty","shippingInformation":"Ships in 3-5 business days","availabilityStatus":"In Stock","reviews":[{"rating":3,"comment":"Would not recommend!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"},{"rating":4,"comment":"Very satisfied!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Lucas Gordon","reviewerEmail":"lucas.gordon@x.dummyjson.com"},{"rating":5,"comment":"Highly impressed!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"}],"returnPolicy":"No return policy","minimumOrderQuantity":48,"meta":{"createdAt":"2025-04-30T09:41:02.053Z","updatedAt":"2025-04-30T09:41:02.053Z","barcode":"5784719087687","qrCode":"https://cdn.dummyjson.com/public/qr-code.png"},"images":["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"],"thumbnail":"https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"},{"id":2,"title":"Eyeshadow Palette with Mirror","description":"The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.","category":"beauty","price":19.99,"discountPercentage":18.19,"rating":2.86,"stock":34,"tags":["beauty","eyeshadow"],"brand":"Glamour Beauty","sku":"BEA-GLA-EYE-002","weight":9,"dimensions":{"width":9.26,"height":22.47,"depth":27.67},"warrantyInformation":"1 year warranty","shippingInformation":"Ships in 2 weeks","availabilityStatus":"In Stock","reviews":[{"rating":5,"comment":"Great product!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Savannah Gomez","reviewerEmail":"savannah.gomez@x.dummyjson.com"},{"rating":4,"comment":"Awesome product!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Christian Perez","reviewerEmail":"christian.perez@x.dummyjson.com"},{"rating":1,"comment":"Poor quality!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Nicholas Bailey","reviewerEmail":"nicholas.bailey@x.dummyjson.com"}],"returnPolicy":"7 days return policy","minimumOrderQuantity":20,"meta":{"createdAt":"2025-04-30T09:41:02.053Z","updatedAt":"2025-04-30T09:41:02.053Z","barcode":"9170275171413","qrCode":"https://cdn.dummyjson.com/public/qr-code.png"},"images":["https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp"],"thumbnail":"https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp"}]
/// total : 194
/// skip : 0
/// limit : 2

ProductResponse productModelsFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productModelsToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse extends Equatable {
  ProductResponse({List<Products>? products, num? total, num? skip, num? limit}) {
    _products = products;
    _total = total;
    _skip = skip;
    _limit = limit;
  }

  ProductResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }

  List<Products>? _products;
  num? _total;
  num? _skip;
  num? _limit;

  ProductResponse copyWith({List<Products>? products, num? total, num? skip, num? limit}) => ProductResponse(
    products: products ?? _products,
    total: total ?? _total,
    skip: skip ?? _skip,
    limit: limit ?? _limit,
  );

  List<Products>? get products => _products;

  num? get total => _total;

  num? get skip => _skip;

  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }

  @override
  List<Object?> get props => [products, total, skip, limit];
}

/// id : 1
/// title : "Essence Mascara Lash Princess"
/// description : "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula."
/// category : "beauty"
/// price : 9.99
/// discountPercentage : 10.48
/// rating : 2.56
/// stock : 99
/// tags : ["beauty","mascara"]
/// brand : "Essence"
/// sku : "BEA-ESS-ESS-001"
/// weight : 4
/// dimensions : {"width":15.14,"height":13.08,"depth":22.99}
/// warrantyInformation : "1 week warranty"
/// shippingInformation : "Ships in 3-5 business days"
/// availabilityStatus : "In Stock"
/// reviews : [{"rating":3,"comment":"Would not recommend!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"},{"rating":4,"comment":"Very satisfied!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Lucas Gordon","reviewerEmail":"lucas.gordon@x.dummyjson.com"},{"rating":5,"comment":"Highly impressed!","date":"2025-04-30T09:41:02.053Z","reviewerName":"Eleanor Collins","reviewerEmail":"eleanor.collins@x.dummyjson.com"}]
/// returnPolicy : "No return policy"
/// minimumOrderQuantity : 48
/// meta : {"createdAt":"2025-04-30T09:41:02.053Z","updatedAt":"2025-04-30T09:41:02.053Z","barcode":"5784719087687","qrCode":"https://cdn.dummyjson.com/public/qr-code.png"}
/// images : ["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"]
/// thumbnail : "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products extends Equatable {
  Products({
    num? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    num? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Reviews>? reviews,
    String? returnPolicy,
    num? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _category = category;
    _price = price;
    _discountPercentage = discountPercentage;
    _rating = rating;
    _stock = stock;
    _tags = tags;
    _brand = brand;
    _sku = sku;
    _weight = weight;
    _dimensions = dimensions;
    _warrantyInformation = warrantyInformation;
    _shippingInformation = shippingInformation;
    _availabilityStatus = availabilityStatus;
    _reviews = reviews;
    _returnPolicy = returnPolicy;
    _minimumOrderQuantity = minimumOrderQuantity;
    _meta = meta;
    _images = images;
    _thumbnail = thumbnail;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _category = json['category'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'];
    _stock = json['stock'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _brand = json['brand'];
    _sku = json['sku'];
    _weight = json['weight'];
    _dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    _warrantyInformation = json['warrantyInformation'];
    _shippingInformation = json['shippingInformation'];
    _availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _returnPolicy = json['returnPolicy'];
    _minimumOrderQuantity = json['minimumOrderQuantity'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
  }

  num? _id;
  String? _title;
  String? _description;
  String? _category;
  num? _price;
  num? _discountPercentage;
  num? _rating;
  num? _stock;
  List<String>? _tags;
  String? _brand;
  String? _sku;
  num? _weight;
  Dimensions? _dimensions;
  String? _warrantyInformation;
  String? _shippingInformation;
  String? _availabilityStatus;
  List<Reviews>? _reviews;
  String? _returnPolicy;
  num? _minimumOrderQuantity;
  Meta? _meta;
  List<String>? _images;
  String? _thumbnail;

  Products copyWith({
    num? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    num? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Reviews>? reviews,
    String? returnPolicy,
    num? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) => Products(
    id: id ?? _id,
    title: title ?? _title,
    description: description ?? _description,
    category: category ?? _category,
    price: price ?? _price,
    discountPercentage: discountPercentage ?? _discountPercentage,
    rating: rating ?? _rating,
    stock: stock ?? _stock,
    tags: tags ?? _tags,
    brand: brand ?? _brand,
    sku: sku ?? _sku,
    weight: weight ?? _weight,
    dimensions: dimensions ?? _dimensions,
    warrantyInformation: warrantyInformation ?? _warrantyInformation,
    shippingInformation: shippingInformation ?? _shippingInformation,
    availabilityStatus: availabilityStatus ?? _availabilityStatus,
    reviews: reviews ?? _reviews,
    returnPolicy: returnPolicy ?? _returnPolicy,
    minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
    meta: meta ?? _meta,
    images: images ?? _images,
    thumbnail: thumbnail ?? _thumbnail,
  );

  num? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get category => _category;

  num? get price => _price;

  num? get discountPercentage => _discountPercentage;

  num? get rating => _rating;

  num? get stock => _stock;

  List<String>? get tags => _tags;

  String? get brand => _brand;

  String? get sku => _sku;

  num? get weight => _weight;

  Dimensions? get dimensions => _dimensions;

  String? get warrantyInformation => _warrantyInformation;

  String? get shippingInformation => _shippingInformation;

  String? get availabilityStatus => _availabilityStatus;

  List<Reviews>? get reviews => _reviews;

  String? get returnPolicy => _returnPolicy;

  num? get minimumOrderQuantity => _minimumOrderQuantity;

  Meta? get meta => _meta;

  List<String>? get images => _images;

  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['category'] = _category;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['rating'] = _rating;
    map['stock'] = _stock;
    map['tags'] = _tags;
    map['brand'] = _brand;
    map['sku'] = _sku;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['warrantyInformation'] = _warrantyInformation;
    map['shippingInformation'] = _shippingInformation;
    map['availabilityStatus'] = _availabilityStatus;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = _returnPolicy;
    map['minimumOrderQuantity'] = _minimumOrderQuantity;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['images'] = _images;
    map['thumbnail'] = _thumbnail;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    meta,
    images,
    thumbnail,
  ];
}

/// createdAt : "2025-04-30T09:41:02.053Z"
/// updatedAt : "2025-04-30T09:41:02.053Z"
/// barcode : "5784719087687"
/// qrCode : "https://cdn.dummyjson.com/public/qr-code.png"

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

class Meta extends Equatable {
  Meta({String? createdAt, String? updatedAt, String? barcode, String? qrCode}) {
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _barcode = barcode;
    _qrCode = qrCode;
  }

  Meta.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _barcode = json['barcode'];
    _qrCode = json['qrCode'];
  }

  String? _createdAt;
  String? _updatedAt;
  String? _barcode;
  String? _qrCode;

  Meta copyWith({String? createdAt, String? updatedAt, String? barcode, String? qrCode}) => Meta(
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    barcode: barcode ?? _barcode,
    qrCode: qrCode ?? _qrCode,
  );

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get barcode => _barcode;

  String? get qrCode => _qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['barcode'] = _barcode;
    map['qrCode'] = _qrCode;
    return map;
  }

  @override
  List<Object?> get props => [createdAt, updatedAt, barcode, qrCode];
}

/// rating : 3
/// comment : "Would not recommend!"
/// date : "2025-04-30T09:41:02.053Z"
/// reviewerName : "Eleanor Collins"
/// reviewerEmail : "eleanor.collins@x.dummyjson.com"

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));

String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews extends Equatable {
  Reviews({num? rating, String? comment, String? date, String? reviewerName, String? reviewerEmail}) {
    _rating = rating;
    _comment = comment;
    _date = date;
    _reviewerName = reviewerName;
    _reviewerEmail = reviewerEmail;
  }

  Reviews.fromJson(dynamic json) {
    _rating = json['rating'];
    _comment = json['comment'];
    _date = json['date'];
    _reviewerName = json['reviewerName'];
    _reviewerEmail = json['reviewerEmail'];
  }

  num? _rating;
  String? _comment;
  String? _date;
  String? _reviewerName;
  String? _reviewerEmail;

  Reviews copyWith({num? rating, String? comment, String? date, String? reviewerName, String? reviewerEmail}) =>
      Reviews(
        rating: rating ?? _rating,
        comment: comment ?? _comment,
        date: date ?? _date,
        reviewerName: reviewerName ?? _reviewerName,
        reviewerEmail: reviewerEmail ?? _reviewerEmail,
      );

  num? get rating => _rating;

  String? get comment => _comment;

  String? get date => _date;

  String? get reviewerName => _reviewerName;

  String? get reviewerEmail => _reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['date'] = _date;
    map['reviewerName'] = _reviewerName;
    map['reviewerEmail'] = _reviewerEmail;
    return map;
  }

  @override
  List<Object?> get props => [rating, comment, date, reviewerName, reviewerEmail];
}

/// width : 15.14
/// height : 13.08
/// depth : 22.99

Dimensions dimensionsFromJson(String str) => Dimensions.fromJson(json.decode(str));

String dimensionsToJson(Dimensions data) => json.encode(data.toJson());

class Dimensions extends Equatable {
  Dimensions({num? width, num? height, num? depth}) {
    _width = width;
    _height = height;
    _depth = depth;
  }

  Dimensions.fromJson(dynamic json) {
    _width = json['width'];
    _height = json['height'];
    _depth = json['depth'];
  }

  num? _width;
  num? _height;
  num? _depth;

  Dimensions copyWith({num? width, num? height, num? depth}) =>
      Dimensions(width: width ?? _width, height: height ?? _height, depth: depth ?? _depth);

  num? get width => _width;

  num? get height => _height;

  num? get depth => _depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = _width;
    map['height'] = _height;
    map['depth'] = _depth;
    return map;
  }

  @override
  List<Object?> get props => [_width, height, depth];
}
