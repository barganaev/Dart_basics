import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class Item {
  final String? uuid;
  final String? name;

  @JsonKey(name: 'poster')
  final String? postt;

  Item({this.uuid, this.name, this.postt});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  // Item.fromJson(Map<String, dynamic> json) : this(
  //   uuid: json['uuid'],
  //   name: json['name'],
  //   postt: json['poster'],
  // );
}

@JsonSerializable()
class ItemDetail {
  final String? uuid;
  final String? name;
  final String? poster;
  final ItemAddress? address;
  final double? price;
  final double? rating;
  final ItemServices? services;
  final List<String>? photos;

  ItemDetail({
    this.uuid,
    this.name,
    this.poster,
    this.address,
    this.price,
    this.rating,
    this.services,
    this.photos
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) => _$ItemDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);
}

@JsonSerializable()
class ItemAddress {
  ItemAddress({
    this.country,
    this.street,
    this.city,
    this.zipCode,
    this.coords,
  });

  final String? country;
  final String? street;
  final String? city;
  final int? zipCode;
  final ItemCoords? coords;

  factory ItemAddress.fromJson(Map<String, dynamic> json) => _$ItemAddressFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAddressToJson(this);
}

@JsonSerializable()
class ItemCoords {
  ItemCoords({
    this.lat,
    this.lan,
  });

  final double? lat;
  final double? lan;

  factory ItemCoords.fromJson(Map<String, dynamic> json) => _$ItemCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCoordsToJson(this);
}

@JsonSerializable()
class ItemServices {
  ItemServices({
    this.free,
    this.paid,
  });

  final List<String>? free;
  final List<String>? paid;

  factory ItemServices.fromJson(Map<String, dynamic> json) => _$ItemServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ItemServicesToJson(this);
}














