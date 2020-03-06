// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/globals.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class LoginViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<CuisineListItem> data = List();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel({@required this.repository});

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  void onLoginBtnClick(BuildContext context) {
    repository
        .login(phoneController.text, passwordController.text)
        .then((value) {
          if(value.hasError()) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(value.msg),
              ),
            );
          } else {
            Globals.getInstance().saveToken(value.token).then((value) {
              Navigator.pushNamed(context, AppRoutes.home);
            });
          }
    });
  }
}
