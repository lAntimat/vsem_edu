import 'package:vsem_edu/network/models/base_response2.dart';

class AddressRequest {
  String city;
  String street;
  String house;
  String apartment;
  String contactPhone;
  String deliveryInstruction;


  AddressRequest(this.city, this.street, this.house, this.apartment,
      this.contactPhone, this.deliveryInstruction);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['city'] = city;
    json['street'] = street;
    json['house'] = house;
    json['apartment'] = apartment;
    json['contactPhone'] = contactPhone;
    json['contactPhone'] = contactPhone;
    return json;
  }
}