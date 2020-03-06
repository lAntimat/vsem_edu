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
      String error
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
        //onChanged: error = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Ваш номер телефона",
          hintStyle: hintStyle,
          errorText: error,
        ),
      ),
    ),
  );
}

Widget signInNameTextField(
    BuildContext context,
    TextEditingController textEditingController,
    TextStyle textStyle,
    TextStyle hintStyle, {
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      String text = "",
      String error
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
        //onChanged: error = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: text,
          hintStyle: hintStyle,
          errorText: error,
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
      String error
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
        //onChanged: error = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Пароль",
          hintStyle: hintStyle,
          errorText: error,
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
      String error
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
        //onChanged: error = null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: "Повторите пароль",
          hintStyle: hintStyle,
          errorText: error,
        ),
      ),
    ),
  );
}