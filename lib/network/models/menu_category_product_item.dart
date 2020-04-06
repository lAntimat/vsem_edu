import 'dart:collection';
import 'dart:convert';

class MenuCategoryProductItem {
  String itemId;
  String merchantId;
  String itemName;
  String itemDescription;
  String status;
  List<String> price;
  List<String> prices;
  String photo;
  String discount;
  String dish;
  String dishImage;


  MenuCategoryProductItem(this.itemId, this.merchantId, this.itemName,
      this.itemDescription, this.status, this.price, this.photo, this.discount,
      this.dish, this.dishImage);

  factory MenuCategoryProductItem.fromJson(Map<String, dynamic> json) => _$MenuCategoryProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuCategoryProductItemToJson(this);

}

MenuCategoryProductItem _$MenuCategoryProductItemFromJson(
    Map<String, dynamic> json) {
  return MenuCategoryProductItem(
    json['item_id'] as String,
    json['merchant_id'] as String,
    json['item_name'] as String,
    json['item_description'] as String,
    json['status'] as String,
    _getPrices(json['price']),
    json['photo'] as String,
    json['discount'] as String,
    json['dish'] as String,
    json['dish_image'] as String,
  )..prices = (json['prices'] as List).map((e) => e as String).toList();
}

Map<String, dynamic> _$MenuCategoryProductItemToJson(
    MenuCategoryProductItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'merchant_id': instance.merchantId,
      'item_name': instance.itemName,
      'item_description': instance.itemDescription,
      'status': instance.status,
      'price': instance.price,
      'prices': instance.prices,
      'photo': instance.photo,
      'discount': instance.discount,
      'dish': instance.dish,
      'dish_image': instance.dishImage,
    };

List<String> _getPrices(String json) {
  var data = jsonDecode(json);
  if (data is List<dynamic>) {
    return List<String>.from(data);
  } else if (data is LinkedHashMap<String, dynamic>) {
    return List<String>.from(data.values.toList());
  }
}