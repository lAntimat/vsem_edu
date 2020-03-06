import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/styles.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/ui/login/register_view_model.dart';
import 'package:vsem_edu/ui/login/views/edit_text_views.dart';

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
                  signInNameTextField(context, model.firstNameController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, text: "Ваше имя", error: model.firstNameError),
                  Container(
                    height: 16,
                  ),
                  signInNameTextField(context, model.secondNameController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, text: "Фамилия", error: model.secondNameError),
                  Container(
                    height: 16,
                  ),
                  signInPhoneTextField(context, model.phoneController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, error: model.phoneError),
                  Container(
                    height: 16,
                  ),
                  signInPasswordTextField(context, model.passwordController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, error: model.regPasswordError),
                  Container(
                    height: 16,
                  ),
                  signInPassword2TextField(context, model.password2Controller,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, error: model.regPassword2Error),
                  Container(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: simpleFilledButton(
                        text: "Зарегистрироваться",
                        color: Color(0xFF7417c6),
                        onPressed: () {
                          model.onRegBtnClick(context);
                        }),
                  ),
                    ],
                  ),
            )
            ),
          ),
        ),
      );
  }
}
