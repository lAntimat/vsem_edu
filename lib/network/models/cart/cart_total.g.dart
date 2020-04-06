// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) {
  return CartTotal(
    json['subtotal'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$CartTotalToJson(CartTotal instance) => <String, dynamic>{
      'subtotal': instance.subtotal,
      'total': instance.total,
    };
