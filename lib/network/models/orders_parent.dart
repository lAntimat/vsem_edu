
import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/network/models/base_response2.dart';
import 'package:vsem_edu/network/models/order.dart';

class OrdersParent extends BaseResponse2 {
  List<Order> items = List();


  OrdersParent(this.items);

  OrdersParent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (!hasError()) {
      (json['details']['data']).forEach((v) {
        items.add(new Order.fromJson(v));
      });
    }
  }
}