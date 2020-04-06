
import 'package:json_annotation/json_annotation.dart';

part 'cart_total.g.dart';

@JsonSerializable(nullable: false)
class CartTotal {
    int subtotal;
    int total;

    CartTotal(this.subtotal, this.total);

    factory CartTotal.fromJson(Map<String, dynamic> json) => _$CartTotalFromJson(json);
    Map<String, dynamic> toJson() => _$CartTotalToJson(this);
}