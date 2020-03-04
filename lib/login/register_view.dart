import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/styles.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/login/login_view_model.dart';
import 'package:vsem_edu/login/register_view_model.dart';
import 'package:vsem_edu/login/views/edit_text_views.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Consumer<RegisterViewModel>(
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
            child: Align(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    size: 80,
                  ),
                  Container(
                    height: 32,
                  ),
                  signInLoginTextField(context, model.loginController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                  Container(
                    height: 16,
                  ),
                  signInEmailTextField(context, model.emailController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                  Container(
                    height: 16,
                  ),
                  signInPasswordTextField(context, model.passwordController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                  Container(
                    height: 16,
                  ),
                  signInPassword2TextField(context, model.password2Controller,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint),
                  Container(
                    height: 32,
                  ),
                  FractionallySizedBox(
                      widthFactor: 0.6,
                      child: simpleFilledButton(
                          text: "Зарегистрироваться",
                          color: Color(0xFF7417c6),
                          onPressed: () {})),
                    ],
                  ),
            )
            ),
          ),
        ),
      );
  }
}
