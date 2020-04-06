import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable(nullable: false)
class Merchant {
  @JsonKey(name: "restaurant_name")
  String restaurantName;
  int rating;
  @JsonKey(name: "background_url")
  String backgroundUrl;

  Merchant(this.restaurantName, this.rating, this.backgroundUrl);

  factory Merchant.fromJson(Map<String, dynamic> json) => _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
