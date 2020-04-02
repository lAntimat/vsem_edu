import 'dart:collection';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'menu_category_product_item.g.dart';

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