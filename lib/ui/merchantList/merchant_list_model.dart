// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/home/home_models.dart';
import 'package:vsem_edu/ui/home/merchant_models.dart';

class MerchantListModel extends ChangeNotifier {
  final MainRepository repository;

  List<CuisineListItem> _cuisines = List();
  List<dynamic> _carousel = List();
  List<MerchantDetail> _cafes = List();
  List<MerchantDetail> cafes = List();

  UnmodifiableListView<CuisineListItem> get cuisines =>
      UnmodifiableListView(_cuisines);

  UnmodifiableListView<dynamic> get carousel => UnmodifiableListView(_carousel);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MerchantListModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadCuisines();
    loadCarousel();
    loadCafes();
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

  void sortCafes(String id) {
    var tempList = _cafes.where((item) => item.merchantId == id);
    cafes.clear();
    cafes.addAll(tempList);
    notifyListeners();
  }

  Future loadCarousel() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCarouselItems().then((loadedTodos) {
      _carousel.addAll(loadedTodos);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future loadCafes() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCafesItems().then((cafess) {
      _cafes.addAll(cafess);
      cafes.addAll(cafess);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }
}
