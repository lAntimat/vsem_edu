import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/busy_overlay.dart';
import 'package:vsem_edu/ui/profile/profile_view_model.dart';
import 'package:vsem_edu/ui/profile/widgets/profile_item_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => GetIt.instance<ProfileViewModel>(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, _) => BusyOverlay(
          show: model.isLoading,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 36,
                  ),
                  CachedNetworkImage(
                    imageUrl: model.profile.avatar,
                    height: 110,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Text(
                        model.profile.fullName,
                        style: TextStyle(fontSize: 18),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      profileItemWidget("Главная", onPressed: () {}),
                      profileItemWidget("Мои заказы", onPressed: () {
                        model.onOrdersClick(context);
                      }),
                      profileItemWidget("Адреса доставки", onPressed: () {
                        model.onAddressClick(context);
                      }),
                      profileItemWidget("Баллы", extraText: model.points),
                      profileItemWidget("Настройки"),
                      profileItemWidget("Выйти", onPressed: () {
                        model.onExitClick(context);
                      }),
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
