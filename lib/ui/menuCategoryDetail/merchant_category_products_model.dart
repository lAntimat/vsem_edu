// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';
import 'package:vsem_edu/repository/main_repository.dart';

class MerchantCategoryProductsModel extends ChangeNotifier {
  final MainRepository repository;

  List<MenuCategoryProductItem> items = List();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String merchantId = "3";
  String categoryId = "3";

  MerchantCategoryProductsModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadCategoryProducts(merchantId, categoryId);
  }


  Future loadCategoryProducts(String merchantId, catId) {
    _isLoading = true;
    notifyListeners();

    return repository.getMenuProducts(merchantId, catId).then((_items) {
      items.clear();
      items.addAll(_items);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }
}
