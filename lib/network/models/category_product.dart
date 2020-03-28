class CategoryProduct {
  String itemId;
  String merchantId;
  String itemName;
  String itemDescription;
  String itemNameTrans;
  String itemDescriptionTrans;
  String status;
  String price;
  String photo;
  String discount;
  String dish;
  List<String> prices;
  String catId;
  String dishImage;

  CategoryProduct(
      {this.itemId,
        this.merchantId,
        this.itemName,
        this.itemDescription,
        this.itemNameTrans,
        this.itemDescriptionTrans,
        this.status,
        this.price,
        this.photo,
        this.discount,
        this.dish,
        this.prices,
        this.catId,
        this.dishImage});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    merchantId = json['merchant_id'];
    itemName = json['item_name'];
    itemDescription = json['item_description'];
    itemNameTrans = json['item_name_trans'];
    itemDescriptionTrans = json['item_description_trans'];
    status = json['status'];
    price = json['price'];
    photo = json['photo'];
    discount = json['discount'];
    dish = json['dish'];
    prices = json['prices'].cast<String>();
    catId = json['cat_id'];
    dishImage = json['dish_image'];
  }
}