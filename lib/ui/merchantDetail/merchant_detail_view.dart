import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/common/widgets/progress_bar.dart';
import 'package:vsem_edu/network/models/menu_category_item.dart';
import 'package:vsem_edu/network/models/restaurant_info_response.dart';
import 'package:vsem_edu/ui/home/carousel_widget.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';

class MerchantDetailView extends StatelessWidget {
  const MerchantDetailView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Consumer<MerchantDetailModel>(
        builder: (context, model, _) {
          return !model.isLoading
              ? Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        getCarouselWidget(model),
                        Container(
                          height: 32,
                          color: AppColors.lightGreyBg,
                        ),
                        model.restaurantInfo != null ? restaurantDescription(model.restaurantInfo) : Container(),
                        Container(
                          height: 16,
                          color: AppColors.lightGreyBg,
                        ),
                        categoriesWidget()
                      ],
                    ),
                  ),
                )
              : Container(
                  height: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }

  Widget getCarouselWidget(MerchantDetailModel model) {
    return model.carousel.length > 0
        ? CarouselWidget(model.carousel).build()
        : Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ProgressBar(),
            ),
          );
  }

  Widget restaurantDescription(RestaurantInfoResponse info) {
    var textStyle = TextStyle(color: AppColors.blackText);
    return Card(
      elevation: 0,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  info.restaurantName,
                  style: TextStyle(color: AppColors.blackText, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "150 отзывов",
                  style: TextStyle(color: AppColors.blackText, fontSize: 16),
                ),
                buttonTransparentBg("ВСЕ ОТЗЫВЫ",
                    textColor: AppColors.orange, fontSize: 18, onPressed: () {})
              ],
            ),
            Text(
              "Длиннннооооооооое описание ресторааааааааааааааааааана ресторааааааааааааааааааана ресторана ресторана ресторана ресторана ресторана",
              style: TextStyle(color: AppColors.blackText, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriesWidget() {
    return Consumer<MerchantDetailModel>(
      builder: (context, model, _) => Column(
        children: List.generate(
          model.menu != null ? model.menu.items.length : 0,
          (index) {
            var item = model.menu.items[index];
            return listTile(item, () {
              model.onMenuCategoryItemClick(context, item);
            });
          },
        ),
      ),
    );
  }

  Widget listTile(MenuCategoryItem menu, VoidCallback callback) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: callback,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: menu.categoryPic,
                  height: 56,
                  width: 56,
                ),
                Container(
                  width: 8,
                ),
                Text(
                  menu.categoryName.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Container(
              height: 8,
            ),
            Divider(
              height: 1,
              color: AppColors.divider,
            )
          ],
        ),
      ),
    );
  }
}
