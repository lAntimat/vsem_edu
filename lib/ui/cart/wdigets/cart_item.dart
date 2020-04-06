import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/ui/cart/wdigets/items_picker.dart';

Widget cartItem({String name, String count, String price}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Card(
      elevation: 8,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: AppColors.blackText, fontSize: 16),
                ),
                Container(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Кол-во:",
                      style: TextStyle(color: AppColors.blackText),
                    ),
                    Container(
                      width: 8,
                    ),
                    ItemPicker(count: int.tryParse(count) ?? 0,),
                    Container(
                      width: 8,
                    ),
                  ],
                ),
                Container(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Цена: ",
                      style: TextStyle(color: AppColors.blackText, fontSize: 16),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      " руб",
                      style: TextStyle(color: AppColors.blackText, fontSize: 16),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
