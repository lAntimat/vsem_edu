import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/ui/cart/cart_view_model.dart';

import 'wdigets/cart_item.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Consumer<CartViewModel>(
        builder: (context, model, _) => Container(
          child: Container(
            color: AppColors.backgroundLight,
            height: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                 ListView(
                   shrinkWrap: true,
                   children: List.generate(model.cartItems.length, (index) {
                     var item = model.cartItems[index];
                     return cartItem(name: item.itemName, count: item.qty.toString(), price: item.normalPrice);
                   }),
                 ),
                  Container(height: 32,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: model.total != null ? simpleFilledButton(
                        text: "Оформить заказ на ${model.total.total} руб",
                        color: Color(0xFF7417c6),
                        onPressed: () {}) : Container(),
                  ),
                    ],
                  ),
            )
            ),
          ),
        ),
      );
  }
}
