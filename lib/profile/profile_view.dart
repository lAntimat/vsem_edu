import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/login/login_view_model.dart';
import 'package:vsem_edu/profile/widgets/profile_item_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => GetIt.instance<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, _) => Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Color(0xFF7517c5), Color(0xFFe25001)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(height: 36,),
                    Icon(Icons.account_circle, size: 110,),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Text("Иван Петров", style: TextStyle(fontSize: 18),),
                        Align(
                          alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: IconButton(onPressed: () {}, icon: Icon(Icons.edit),),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      profileItemWidget("Главная", onPressed: () {}),
                      profileItemWidget("Мои заказы"),
                      profileItemWidget("Адреса доставки"),
                      profileItemWidget("Баллы", extraText: "1911"),
                      profileItemWidget("Настройки"),
                      profileItemWidget("Выйти"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
