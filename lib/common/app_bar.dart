import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      gradient: new LinearGradient(
        colors: [Color(0xFF7517c5), Color(0xFFe25001)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
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