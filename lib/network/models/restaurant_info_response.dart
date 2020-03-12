import 'package:vsem_edu/network/models/merchant_models.dart';

class RestaurantInfoResponse {
  String merchantId;
  String restaurantName;
  String completeAddress;
  String latitude;
  String lontitude;
  String cuisine;
  String logo;
  String backgroundUrl;
  String closeMessage;
  String statusRaw;
  String status;
  int gallery;
  Rating rating;
  bool addedAsFavorite;


  RestaurantInfoResponse(this.merchantId, this.restaurantName,
      this.completeAddress, this.latitude, this.lontitude, this.cuisine,
      this.logo, this.backgroundUrl, this.closeMessage, this.statusRaw,
      this.status, this.gallery, this.rating, this.addedAsFavorite);

  RestaurantInfoResponse.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchant_id'];
    restaurantName = json['restaurant_name'];
    completeAddress = json['complete_address'];
    latitude = json['latitude'];
    lontitude = json['lontitude'];
    cuisine = json['cuisine'];
    logo = json['logo'];
    backgroundUrl = json['background_url'];
    closeMessage = json['close_message'];
    statusRaw = json['status_raw'];
    status = json['status'];
    gallery = json['gallery'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }
}
