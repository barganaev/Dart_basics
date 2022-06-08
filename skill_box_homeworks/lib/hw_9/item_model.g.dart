// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    postt: json['poster'] as String,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.postt,
    };

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) {
  return ItemDetail(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
    address: json['address'] == null
        ? null
        : ItemAddress.fromJson(json['address'] as Map<String, dynamic>),
    price: (json['price'] as num)?.toDouble(),
    rating: (json['rating'] as num)?.toDouble(),
    services: json['services'] == null
        ? null
        : ItemServices.fromJson(json['services'] as Map<String, dynamic>),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ItemDetailToJson(ItemDetail instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

ItemAddress _$ItemAddressFromJson(Map<String, dynamic> json) {
  return ItemAddress(
    country: json['country'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
    zipCode: json['zipCode'] as int,
    coords: json['coords'] == null
        ? null
        : ItemCoords.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemAddressToJson(ItemAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'coords': instance.coords,
    };

ItemCoords _$ItemCoordsFromJson(Map<String, dynamic> json) {
  return ItemCoords(
    lat: (json['lat'] as num)?.toDouble(),
    lan: (json['lan'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ItemCoordsToJson(ItemCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

ItemServices _$ItemServicesFromJson(Map<String, dynamic> json) {
  return ItemServices(
    free: (json['free'] as List)?.map((e) => e as String)?.toList(),
    paid: (json['paid'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ItemServicesToJson(ItemServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
