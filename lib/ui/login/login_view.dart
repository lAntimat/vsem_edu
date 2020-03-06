import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/common/styles.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/ui/login/login_view_model.dart';
import 'package:vsem_edu/ui/login/views/edit_text_views.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => GetIt.instance<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, _) => Container(
          child: Container(
            height: double.infinity,
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
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 110,
                        ),
                        Container(
                          height: 32,
                        ),
                        signInPhoneTextField(context, model.phoneController,
                            Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                        Container(
                          height: 16,
                        ),
                        signInPasswordTextField(context, model.passwordController,
                            Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                        Container(height: 8,),
                        buttonTransparentBg("Забыли пароль?", onPressed: () {}),
                        Container(
                          height: 8,
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.4,
                            child: simpleFilledButton(
                                text: "Войти",
                                color: Color(0xFF7417c6),
                                onPressed: () {
                                  model.onLoginBtnClick(context);
                                })),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Нет аккаунта?"),
                    buttonTransparentBg("Зарегистрироваться", onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.auth);
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
