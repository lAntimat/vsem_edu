import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Ваш адрес", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
          Row(
            children: <Widget>[
              Text("г. Москва, Восточный район, ул. Ленина", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
              Icon(Icons.arrow_drop_down)
            ],
          )
        ],
      ),
      actions: <Widget>[
        /*ValueListenableBuilder<_HomeScreenTab>(
            valueListenable: _tab,
            builder: (_, tab, __) => FilterButton(
              isActive: tab == _HomeScreenTab.todos,
            ),
          ),*/
      ],
    );
  }
}