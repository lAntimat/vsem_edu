import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable(nullable: false)
class CartItem {

  @JsonKey(name: "item_id")
  String itemId;
  @JsonKey(name: "item_name")
  String itemName;
  @JsonKey(name: "qty")
  dynamic qty;
  @JsonKey(name: "normal_price")
  String normalPrice;
  @JsonKey(name: "discounted_price")
  dynamic discountedPrice;
  String discount;

  CartItem(this.itemId, this.itemName, this.qty, this.normalPrice,
      this.discountedPrice, this.discount);

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}