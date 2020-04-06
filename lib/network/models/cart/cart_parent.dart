import 'dart:convert';

import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/network/models/base_response2.dart';
import 'package:vsem_edu/network/models/cart/cart.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';
import 'package:vsem_edu/network/models/point.dart';

class CartParent extends BaseResponse2 {
  Cart cart;

  CartParent(this.cart);

  CartParent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (!hasError()) {
      cart = Cart.fromJson(json['details']);
    }
  }
}