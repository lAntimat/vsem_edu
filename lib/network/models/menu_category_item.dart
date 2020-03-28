import 'package:vsem_edu/network/models/base_response2.dart';

class MenuCategoryItem {
  String catId;
  String categoryName;
  String categoryDescription;
  String categoryPic;

  MenuCategoryItem(
      {this.catId,
        this.categoryName,
        this.categoryDescription,
        this.categoryPic});

  MenuCategoryItem.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    categoryPic = json['category_pic'];
  }
}