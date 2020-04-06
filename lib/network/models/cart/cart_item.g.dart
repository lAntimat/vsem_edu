// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    json['item_id'] as String,
    json['item_name'] as String,
    json['qty'] as dynamic,
    json['normal_price'] as String,
    json['discounted_price'] as dynamic,
    json['discount'] as String,
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'qty': instance.qty,
      'normal_price': instance.normalPrice,
      'discounted_price': instance.discountedPrice,
      'discount': instance.discount,
    };
