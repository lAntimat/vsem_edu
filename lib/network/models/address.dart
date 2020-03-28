import 'package:vsem_edu/network/models/base_response2.dart';

class Address {
  String id;
  String asDefault;
  String address;
  String createdDate;
  String addedDate;


  Address(this.id, this.asDefault, this.address,
      this.createdDate, this.addedDate);

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    asDefault = json['as_default'];
    address = json['address'];
    createdDate = json['date_created'];
    addedDate = json['date_added'];
  }
}