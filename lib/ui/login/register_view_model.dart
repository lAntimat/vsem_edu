// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/network/models/create_account_response.dart';
import 'package:vsem_edu/network/models/create_user_dto.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class RegisterViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<CuisineListItem> data = List();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  String firstNameError;
  String secondNameError;
  String regPasswordError;
  String regPassword2Error;
  String phoneError;

  RegisterViewModel({@required this.repository});

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  void onRegBtnClick(BuildContext context) {
    _clearErrors();
    _validateFields();

    if (_haveNotErrors()) {
      repository
          .createUser(CreateUserDto(
              firstNameController.text,
              secondNameController.text,
              phoneController.text,
              passwordController.text,
              password2Controller.text))
          .then((value) {
        if (!value.hasError())
          Navigator.pushNamed(context, AppRoutes.code,
              arguments: value);
        else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(value.msg),
            ),
          );
        }
      });
    }
  }

  void _validateFields() {
    if (firstNameController.text.isEmpty) firstNameError = _getEmptyErrorText();
    if (secondNameController.text.isEmpty)
      secondNameError = _getEmptyErrorText();
    if (phoneController.text.isEmpty) phoneError = _getEmptyErrorText();
    if (passwordController.text.isEmpty)
      regPasswordError = _getEmptyErrorText();
    if (password2Controller.text.isEmpty)
      regPassword2Error = _getEmptyErrorText();
    notifyListeners();
  }

  void _clearErrors() {
    firstNameError = null;
    secondNameError = null;
    phoneError = null;
    regPasswordError = null;
    regPassword2Error = null;
    notifyListeners();
  }

  bool _haveNotErrors() {
    if (firstNameError != null) return false;
    if (secondNameError != null) return false;
    if (phoneError != null) return false;
    if (regPasswordError != null) return false;
    if (regPassword2Error != null) return false;
    return true;
  }

  String _getEmptyErrorText() {
    return "Поле не может быть пустым";
  }
}
