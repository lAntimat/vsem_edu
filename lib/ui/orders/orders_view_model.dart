// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/network/models/order.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class OrdersViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<Order> data = List();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OrdersViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadData();
  }

  void _loadData() {
    _isLoading = true;
    notifyListeners();
    repository.getOrders().then((value) {
      data.clear();
      data.addAll(value);
      _isLoading = false;
       notifyListeners();
    }).catchError((error) {
      _isLoading = false;
    });
  }
}
