import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/network/models/order.dart';
import 'package:vsem_edu/ui/orders/orders_view_model.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<OrdersViewModel>(
        builder: (context, model, _) => Container(
          child: Container(
              color: AppColors.backgroundLight,
              height: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView(
                    shrinkWrap: true,
                    children: List.generate(model.data.length, (index) {
                      return getTile(model.data[index]);
                    })),
              )),
        ),
      ),
    );
  }

  Widget getTile(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CachedNetworkImage(imageUrl: order.logo, height: 64,),
                  Container(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(order.merchantName, style: TextStyle(color: AppColors.blackText, fontSize: 18),),
                      Container(height: 4,),
                      Text(order.transaction, style: TextStyle(color: AppColors.secondaryBlackText, fontSize: 16),),
                      Container(height: 4,),
                      Text(order.paymentType, style: TextStyle(color: AppColors.secondaryBlackText, fontSize: 16),),
                    ],
                  ),
                ],
              ),
              Container(height: 16,),
              Divider(height: 1, color: AppColors.divider,),
              Container(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(order.dateCreated, style: TextStyle(color: AppColors.blackText),),
                  Text(order.totalWTax, style: TextStyle(color: AppColors.blackText),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
