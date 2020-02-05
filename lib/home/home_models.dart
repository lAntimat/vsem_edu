class Cuisine {
  int code;
  String msg;
  Details details;

  Cuisine({this.code, this.msg, this.details});

  Cuisine.fromJson(Map<String, dynamic> json) {
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
  String total;
  String sortbySelected;
  String pageAction;
  int paginateTotal;
  List<CuisineListItem> list;

  Details(
      {this.total,
        this.sortbySelected,
        this.pageAction,
        this.paginateTotal,
        this.list});

  Details.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    sortbySelected = json['sortby_selected'];
    pageAction = json['page_action'];
    paginateTotal = json['paginate_total'];
    if (json['list'] != null) {
      list = new List<CuisineListItem>();
      json['list'].forEach((v) {
        list.add(new CuisineListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['sortby_selected'] = this.sortbySelected;
    data['page_action'] = this.pageAction;
    data['paginate_total'] = this.paginateTotal;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CuisineListItem  {
  String id;
  String name;
  String featuredImage;
  String totalMerchant;

  CuisineListItem({this.id, this.name, this.featuredImage, this.totalMerchant});

  CuisineListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    featuredImage = json['featured_image'];
    totalMerchant = json['total_merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['featured_image'] = this.featuredImage;
    data['total_merchant'] = this.totalMerchant;
    return data;
  }
}

class Get {
  String deviceId;
  String devicePlatform;
  String deviceUiid;
  String apiKey;
  String lang;

  Get(
      {this.deviceId,
        this.devicePlatform,
        this.deviceUiid,
        this.apiKey,
        this.lang});

  Get.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    devicePlatform = json['device_platform'];
    deviceUiid = json['device_uiid'];
    apiKey = json['api_key'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_id'] = this.deviceId;
    data['device_platform'] = this.devicePlatform;
    data['device_uiid'] = this.deviceUiid;
    data['api_key'] = this.apiKey;
    data['lang'] = this.lang;
    return data;
  }
}