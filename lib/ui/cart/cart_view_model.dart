// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/network/models/cart/cart_item.dart';
import 'package:vsem_edu/network/models/cart/cart_total.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class CartViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<CartItem> cartItems = List();
  CartTotal total;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  CartViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadData();
  }

  void _loadData() {
    repository.getCart()
        .then((value) {
          if(value.hasError()) Fluttertoast.showToast(msg: value.msg);
          else {
            cartItems.clear();
            cartItems.addAll(value.cart.data.item);

            total = value.cart.data.total;
          }
          notifyListeners();
    });
  }
}
