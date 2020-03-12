import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
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
}
