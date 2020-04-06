// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
    CartData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'merchant': instance.merchant,
      'data': instance.data,
    };
