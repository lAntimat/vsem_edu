import 'dart:convert';

import 'package:vsem_edu/network/models/base_response2.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';

class MenuCategoryProductItemParent extends BaseResponse2 {
  List<MenuCategoryProductItem> items = List();


  MenuCategoryProductItemParent(this.items);

  MenuCategoryProductItemParent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (!hasError()) {
      (json['details']['data']).forEach((v) {
        items.add(new MenuCategoryProductItem.fromJson(v));
      });
    }
  }
}