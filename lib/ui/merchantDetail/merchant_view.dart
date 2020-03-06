
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';

class MerchantView extends StatelessWidget {
  const MerchantView();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MerchantDetailModel>(
      create: (context) => GetIt.instance<MerchantDetailModel>(),
      child: Container(
        color: AppColors.background,
        child: Consumer<MerchantDetailModel>(
          builder: (context, model, _) =>
          !model.isLoading
              ? Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  merchantsList(),
                ],
              ),
            ),
          )
              : Container(
            height: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Widget merchantsList() {
    return Consumer<MerchantDetailModel>(
        builder: (context, model, _) {
          return Column(
              children:
              List.generate(model.cafes.length, (index) {
                var item = model.cafes[index];
                return Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      height: 100,
                        width: 100,
                        imageUrl: item.backgroundUrl
                    ),
                    Container(width: 16,),
                    Column(children: <Widget>[
                      Text(item.restaurantName, style: TextStyle(fontSize: 14, color: AppColors.blackText),),
                      Text(item.restaurantName, style: TextStyle(fontSize: 14, color: AppColors.blackText),)
                    ],)
                  ],
                );
              })
          );
        }
    );
  }
}
