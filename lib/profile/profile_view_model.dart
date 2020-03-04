// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/home/home_models.dart';
import 'package:vsem_edu/home/merchant_models.dart';
import 'package:vsem_edu/repository/main_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<CuisineListItem> data = List();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProfileViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

  }
}
