import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/globals.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.supervised_user_circle),
            color: Colors.white,
            onPressed: () {
              if(Globals.getInstance().token.isEmpty) {
                Navigator.pushNamed(context, AppRoutes.login);
              } else Navigator.pushNamed(context, AppRoutes.profile);
            },
          ),
          IconButton(
            icon: Icon(Icons.volume_mute),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.merchantList);
            },
          ),
        ],
      ),
    );
  }

}