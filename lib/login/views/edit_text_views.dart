import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget signInPhoneTextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
    }) {
  if (focusNode == null) focusNode = FocusNode();
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Container(
      color: Colors.white,
      child: TextField(
        controller: textEditingController,
        style: textStyle,
        keyboardType: TextInputType.phone,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        //onChanged: model.phoneError = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Ваш логин или E-mail",
          hintStyle: hintStyle,
          //errorText: model.phoneError,
        ),
      ),
    ),
  );
}

Widget signInLoginTextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
    }) {
  if (focusNode == null) focusNode = FocusNode();
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Container(
      color: Colors.white,
      child: TextField(
        controller: textEditingController,
        style: textStyle,
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        //onChanged: model.phoneError = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Ваш логин",
          hintStyle: hintStyle,
          //errorText: model.phoneError,
        ),
      ),
    ),
  );
}

Widget signInEmailTextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
    }) {
  if (focusNode == null) focusNode = FocusNode();
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Container(
      color: Colors.white,
      child: TextField(
        controller: textEditingController,
        style: textStyle,
        keyboardType: TextInputType.emailAddress,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        //onChanged: model.phoneError = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "E-mail",
          hintStyle: hintStyle,
          //errorText: model.phoneError,
        ),
      ),
    ),
  );
}

Widget signInPasswordTextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
    }) {
  if (focusNode == null) focusNode = FocusNode();
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Container(
      color: Colors.white,
      child: TextField(
        controller: textEditingController,
        style: textStyle,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        keyboardType: TextInputType.text,
        obscureText: true,
        //onChanged: model.phoneError = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Пароль",
          hintStyle: hintStyle,
          //errorText: model.phoneError,
        ),
      ),
    ),
  );
}

Widget signInPassword2TextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
    }) {
  if (focusNode == null) focusNode = FocusNode();
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Container(
      color: Colors.white,
      child: TextField(
        controller: textEditingController,
        style: textStyle,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        keyboardType: TextInputType.text,
        obscureText: true,
        //onChanged: model.phoneError = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Повторите пароль",
          hintStyle: hintStyle,
          //errorText: model.phoneError,
        ),
      ),
    ),
  );
}