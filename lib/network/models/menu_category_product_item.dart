import 'package:vsem_edu/network/models/base_response2.dart';

class MenuCategoryProductItem {
  String itemId;
  String merchantId;
  String itemName;
  String itemDescription;
  String status;
  String price;
  String photo;
  String discount;
  String dish;
  String dishImage;


  MenuCategoryProductItem(this.itemId, this.merchantId, this.itemName,
      this.itemDescription, this.status, this.price, this.photo, this.discount,
      this.dish, this.dishImage);

  MenuCategoryProductItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    merchantId = json['merchant_id'];
    itemName = json['item_name'];
    itemDescription = json['item_description'];
    status = json['status'];
    price = json['price'];
    photo = json['photo'];
    discount = json['discount'];
    dish = json['dish'];
    dishImage = json['dish_image'];
  }
}