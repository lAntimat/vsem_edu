// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/network/models/menu_category_item.dart';
import 'package:vsem_edu/network/models/menu_category_items_parent.dart';
import 'package:vsem_edu/network/models/restaurant_info_response.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/argumentmodels/MerchantDetailArguments.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class MerchantDetailModel extends ChangeNotifier {
  final MainRepository repository;

  List<CuisineListItem> _cuisines = List();
  MenuCategoryItemParent menu;
  List<String> carousel = List();
  RestaurantInfoResponse restaurantInfo;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String merchantId = "3";

  MerchantDetailModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadRestaurantInfo();
    loadMenu();
  }

  Future loadCarousel() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCarouselItems().then((loadedTodos) {
      carousel.addAll(loadedTodos);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future loadMenu() {
    _isLoading = true;
    notifyListeners();

    return repository.getMenu(merchantId).then((loadedMenu) {
      menu = loadedMenu;
      print(menu.toString());
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future loadRestaurantInfo() {
    _isLoading = true;
    notifyListeners();

    return repository.getRestaurantInfo(merchantId).then((restaurant) {
      restaurantInfo = restaurant.data;
      carousel.add(restaurant.data.backgroundUrl);
      _isLoading = false;

      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future loadRestaurantCategories(String merchantId) {
    _isLoading = true;
    notifyListeners();

    return repository.getRestaurantInfo(merchantId).then((restaurant) {
      restaurantInfo = restaurant.data;
      carousel.add(restaurant.data.backgroundUrl);
      _isLoading = false;

      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  void onMenuCategoryItemClick(BuildContext context, MenuCategoryItem item) {
    var args = MerchantDetailArguments(merchantId, item.catId, item.categoryName);
    Navigator.pushNamed(context, AppRoutes.merchantCategoryProducts, arguments: args);
  }

}
