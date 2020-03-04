import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/common/routes.dart';

import '../app_colors.dart';

class FabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 4.0,
        child: const Icon(
          Icons.shopping_basket,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.blackBg,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.basket);
        });
  }
}
