import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/common/app_colors.dart';

TextStyle _textStyle = TextStyle(color: AppColors.blackText, fontSize: 18);

Widget profileItemWidget(String text, {VoidCallback onPressed, String extraText}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onPressed,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                      style: _textStyle,
                      textAlign: TextAlign.start,
                    ),
                    extraText != null ? Container(padding: EdgeInsets.all(8), color: Color(0xFFe25100), child: Text(extraText),) : Container()
                  ],
                ),
              ),
              Container(
                height: 4,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xFFcccccc),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
