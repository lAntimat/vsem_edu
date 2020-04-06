// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartData _$CartDataFromJson(Map<String, dynamic> json) {
  return CartData(
    (json['item'] as List)
        .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    CartTotal.fromJson(json['total'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'item': instance.item,
      'total': instance.total,
    };
