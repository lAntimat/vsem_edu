// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/network/models/restaurant_info_response.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class MerchantDetailModel extends ChangeNotifier {
  final MainRepository repository;

  List<CuisineListItem> _cuisines = List();
  List<String> carousel = List();
  RestaurantInfoResponse restaurantInfo;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String merchantId;

  MerchantDetailModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadRestaurantInfo("3");
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

  Future loadCuisines() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCuisine().then((loadedTodos) {
      _cuisines.addAll(loadedTodos);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future loadRestaurantInfo(String merchantId) {
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
}
