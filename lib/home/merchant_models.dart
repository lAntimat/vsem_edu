class ResponseMerchant {
  int code;
  String msg;
  Details details;

  ResponseMerchant({this.code, this.msg, this.details});

  ResponseMerchant.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  String searchType;
  String totalRecords;
  String sortbySelected;
  String pageAction;
  int paginateTotal;
  String mapPage;
  List<MerchantDetail> list;

  Details(
      {this.searchType,
        this.totalRecords,
        this.sortbySelected,
        this.pageAction,
        this.paginateTotal,
        this.mapPage,
        this.list});

  Details.fromJson(Map<String, dynamic> json) {
    searchType = json['search_type'];
    totalRecords = json['total_records'];
    sortbySelected = json['sortby_selected'];
    pageAction = json['page_action'];
    paginateTotal = json['paginate_total'];
    mapPage = json['map_page'];
    if (json['list'] != null) {
      list = new List<MerchantDetail>();
      json['list'].forEach((v) {
        list.add(new MerchantDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search_type'] = this.searchType;
    data['total_records'] = this.totalRecords;
    data['sortby_selected'] = this.sortbySelected;
    data['page_action'] = this.pageAction;
    data['paginate_total'] = this.paginateTotal;
    data['map_page'] = this.mapPage;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MerchantDetail {
  String merchantId;
  String restaurantName;
  String cuisine;
  String logo;
  String latitude;
  String lontitude;
  String isSponsored;
  String deliveryCharges;
  String service;
  String status;
  String isReady;
  String minimumOrder;
  String minimumOrderRaw;
  String isFeatured;
  String address;
  String distance;
  String openStatusRaw;
  String openStatus;
  String backgroundUrl;
  Rating rating;
  String distancePlot;
  String deliveryFee;

  MerchantDetail(
      {this.merchantId,
        this.restaurantName,
        this.cuisine,
        this.logo,
        this.latitude,
        this.lontitude,
        this.isSponsored,
        this.deliveryCharges,
        this.service,
        this.status,
        this.isReady,
        this.minimumOrder,
        this.minimumOrderRaw,
        this.isFeatured,
        this.address,
        this.distance,
        this.openStatusRaw,
        this.openStatus,
        this.backgroundUrl,
        this.rating,
        this.distancePlot,
        this.deliveryFee});

  MerchantDetail.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchant_id'];
    restaurantName = json['restaurant_name'];
    cuisine = json['cuisine'];
    logo = json['logo'];
    latitude = json['latitude'];
    lontitude = json['lontitude'];
    isSponsored = json['is_sponsored'];
    deliveryCharges = json['delivery_charges'];
    service = json['service'];
    status = json['status'];
    isReady = json['is_ready'];
    minimumOrder = json['minimum_order'];
    minimumOrderRaw = json['minimum_order_raw'];
    isFeatured = json['is_featured'];
    address = json['address'];
    distance = json['distance'];
    openStatusRaw = json['open_status_raw'];
    openStatus = json['open_status'];
    backgroundUrl = json['background_url'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    distancePlot = json['distance_plot'];
    deliveryFee = json['delivery_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchant_id'] = this.merchantId;
    data['restaurant_name'] = this.restaurantName;
    data['cuisine'] = this.cuisine;
    data['logo'] = this.logo;
    data['latitude'] = this.latitude;
    data['lontitude'] = this.lontitude;
    data['is_sponsored'] = this.isSponsored;
    data['delivery_charges'] = this.deliveryCharges;
    data['service'] = this.service;
    data['status'] = this.status;
    data['is_ready'] = this.isReady;
    data['minimum_order'] = this.minimumOrder;
    data['minimum_order_raw'] = this.minimumOrderRaw;
    data['is_featured'] = this.isFeatured;
    data['address'] = this.address;
    data['distance'] = this.distance;
    data['open_status_raw'] = this.openStatusRaw;
    data['open_status'] = this.openStatus;
    data['background_url'] = this.backgroundUrl;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['distance_plot'] = this.distancePlot;
    data['delivery_fee'] = this.deliveryFee;
    return data;
  }
}

class Rating {
  int ratings;
  int votes;
  String reviewCount;

  Rating({this.ratings, this.votes, this.reviewCount});

  Rating.fromJson(Map<String, dynamic> json) {
    ratings = json['ratings'];
    votes = json['votes'];
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratings'] = this.ratings;
    data['votes'] = this.votes;
    data['review_count'] = this.reviewCount;
    return data;
  }
}