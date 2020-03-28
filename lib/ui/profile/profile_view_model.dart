// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/globals.dart';
import 'package:vsem_edu/network/models/profile_response.dart';
import 'package:vsem_edu/repository/main_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final MainRepository repository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileResponse profile = ProfileResponse("", "", "", "", "", "");
  String points;

  ProfileViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _getProfileInfo();
    _getPoints();
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

  void _getPoints() {
    notifyListeners();

    repository.getPoints()
        .then((value) {
      if(!value.hasError()) points = value.items.length > 0 ? value.items[0].value.toString() : null;
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
  }

  void onAddressClick(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.address);
  }

  void onOrdersClick(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.orders);
  }

  void onExitClick(BuildContext context) {
    Globals.getInstance().clearUser();
    Navigator.pop(context);
  }
}
