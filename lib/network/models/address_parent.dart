import 'dart:convert';

import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/network/models/base_response2.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';

class AddressParent extends BaseResponse2 {
  List<Address> items = List();


  AddressParent(this.items);

  AddressParent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (!hasError()) {
      (json['details']['data']).forEach((v) {
        items.add(new Address.fromJson(v));
      });
    }
  }
}