
import 'package:json_annotation/json_annotation.dart';

import 'package:vsem_edu/network/models/cart/cart_item.dart';
import 'package:vsem_edu/network/models/cart/cart_total.dart';

part 'cart_data.g.dart';

@JsonSerializable(nullable: false)
class CartData {
  List<CartItem> item;
  CartTotal total;

  CartData(this.item, this.total);

  factory CartData.fromJson(Map<String, dynamic> json) => _$CartDataFromJson(json);
  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}