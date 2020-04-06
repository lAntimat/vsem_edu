import 'package:json_annotation/json_annotation.dart';
import 'package:vsem_edu/network/models/cart/cart_data.dart';
import 'package:vsem_edu/network/models/cart/merchant.dart';

part 'cart.g.dart';

@JsonSerializable(nullable: false)
class Cart {
  Merchant merchant;
  CartData data;


  Cart(this.merchant, this.data);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}