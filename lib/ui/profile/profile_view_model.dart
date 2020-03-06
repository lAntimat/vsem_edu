// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/globals.dart';
import 'package:vsem_edu/network/models/profile_response.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class ProfileViewModel extends ChangeNotifier {
  final MainRepository repository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileResponse profile = ProfileResponse("", "", "", "", "", "");

  ProfileViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _getProfileInfo();
  }

  void _getProfileInfo() {
    _isLoading = true;
    notifyListeners();

    repository.getProfile()
        .then((value) {
          if(!value.hasError()) profile = value.data;
          _isLoading = false;
          notifyListeners();
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
    });
  }

  void onExitClick(BuildContext context) {
    Globals.getInstance().clearUser();
    Navigator.pop(context);
  }
}
