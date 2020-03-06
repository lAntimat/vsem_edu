import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/styles.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/network/models/create_account_response.dart';
import 'package:vsem_edu/ui/login/codescreen/code_view_model.dart';
import 'package:vsem_edu/ui/login/register_view_model.dart';
import 'package:vsem_edu/ui/login/views/edit_text_views.dart';

class CodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final CreateAccountResponse args = ModalRoute.of(context).settings.arguments;

    return Container (
      child: Consumer<CodeViewModel>(
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
                  signInNameTextField(context, model.codeController,
                      Styles.LoginEditTextStyle, Styles.LoginEditTextStyleHint, text: "Введите код из смс", error: model.codeError),
                  Container(
                    height: 16,
                  ),
                  Container(
                    height: 32,
                  ),
                  FractionallySizedBox(
                      widthFactor: 0.6,
                      child: simpleFilledButton(
                          text: "Подтвердить",
                          color: Color(0xFF7417c6),
                          onPressed: () {
                            model.onRegBtnClick(context, args);
                          })),
                    ],
                  ),
            )
            ),
          ),
        ),
      );
  }
}
