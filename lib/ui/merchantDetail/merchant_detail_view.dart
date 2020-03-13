import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/network/models/restaurant_info_response.dart';
import 'package:vsem_edu/ui/home/carousel_widget.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';

class MerchantDetailView extends StatelessWidget {
  const MerchantDetailView();

  @override
  Widget build(BuildContext context) {

    final String merchantId = ModalRoute.of(context).settings.arguments;

    return Container(
      color: AppColors.background,
      child: Consumer<MerchantDetailModel>(
        builder: (context, model, _) {
          model.merchantId = merchantId;
          return !model.isLoading
              ? Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        getCarouselWidget(model),
                        Container(height: 32, color: AppColors.lightGreyBg,),
                        restaurantDescription(model.restaurantInfo),
                        Container(height: 16, color: AppColors.lightGreyBg,),
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
              child: CircularProgressIndicator(),
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
                Text(info.restaurantName, style: TextStyle(color: AppColors.blackText, fontSize: 20),),
                Spacer(),
                Text("150 отзывов", style: TextStyle(color: AppColors.blackText, fontSize: 16),),
                buttonTransparentBg("ВСЕ ОТЗЫВЫ", textColor: AppColors.orange, fontSize: 18, onPressed: () {})
              ],
            ),
            Text("Длиннннооооооооое описание ресторааааааааааааааааааана ресторааааааааааааааааааана ресторана ресторана ресторана ресторана ресторана", style: TextStyle(color: AppColors.blackText, fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
