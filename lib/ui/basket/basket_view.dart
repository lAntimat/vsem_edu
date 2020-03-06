import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/ui/basket/basket_view_model.dart';

import 'wdigets/basket_item.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Consumer<BasketViewModel>(
        builder: (context, model, _) => Container(
          child: Container(
            color: AppColors.backgroundLight,
            height: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                 basketItem(name: "Бургер Бургер", imgUrl: "https://worldcatcomedy.com/wp-content/uploads/2018/03/cat-3089169_640.jpg"),
                 basketItem(name: "Бургер Бургер 2", imgUrl: "https://worldcatcomedy.com/wp-content/uploads/2018/03/cat-3089169_640.jpg"),
                 basketItem(name: "Бургер Бургер 3", imgUrl: "https://worldcatcomedy.com/wp-content/uploads/2018/03/cat-3089169_640.jpg"),
                 basketItem(name: "Бургер Бургер 4", imgUrl: "https://worldcatcomedy.com/wp-content/uploads/2018/03/cat-3089169_640.jpg"),
                 basketItem(name: "Бургер Бургер 5", imgUrl: "https://worldcatcomedy.com/wp-content/uploads/2018/03/cat-3089169_640.jpg"),
                  Container(height: 32,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: simpleFilledButton(
                        text: "Оформить заказ на 1000 руб",
                        color: Color(0xFF7417c6),
                        onPressed: () {}),
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
