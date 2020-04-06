// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return Merchant(
    json['restaurant_name'] as String,
    json['rating'] as int,
    json['background_url'] as String,
  );
}

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'restaurant_name': instance.restaurantName,
      'rating': instance.rating,
      'background_url': instance.backgroundUrl,
    };
