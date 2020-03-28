import 'package:vsem_edu/network/models/base_response2.dart';
import 'package:vsem_edu/network/models/menu_category_item.dart';

class MenuCategoryItemParent extends BaseResponse2 {
  List<MenuCategoryItem> items = List();

  MenuCategoryItemParent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (!hasError()) {
      json['details']['list'].forEach((v) {
        items.add(new MenuCategoryItem.fromJson(v));
      });
    }
  }
}
