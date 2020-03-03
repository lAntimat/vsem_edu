import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/styles.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/login/login_view_model.dart';
import 'package:vsem_edu/login/views/edit_text_views.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => GetIt.instance<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, _) => Container(
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
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
                buttonTransparentBg("Забыли пароль?", onPressed: () {}),
                Container(
                  height: 8,
                ),
                FractionallySizedBox(
                    widthFactor: 0.4,
                    child: simpleFilledButton(
                        text: "Войти",
                        color: Color(0xFF7417c6),
                        onPressed: () {})),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Нет аккаунта?"),
                    buttonTransparentBg("Зарегистрироваться", onPressed: () {})
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
