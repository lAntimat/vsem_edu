import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vsem_edu/basket/wdigets/items_picker.dart';
import 'package:vsem_edu/common/app_colors.dart';

Widget basketItem({String name, String imgUrl, int count}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Card(
      elevation: 8,
      color: AppColors.white,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl:
                imgUrl,
            height: 80,
          ),
          Container(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.blackText, fontSize: 18),
              ),
              Container(
                height: 8,
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
                  ItemPicker(),
                  Container(
                    width: 8,
                  ),
                  Text(
                    "Цена: ",
                    style: TextStyle(color: AppColors.blackText, fontSize: 18),
                  ),
                  Text(
                    "850",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    " руб",
                    style: TextStyle(color: AppColors.blackText, fontSize: 18),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
