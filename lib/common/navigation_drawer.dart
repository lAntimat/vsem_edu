import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(height: 64),
          ListTile(
            title: Text('Главная'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Вход / Регистрация'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('О нас'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Служба поддержки'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Стать партнером'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
