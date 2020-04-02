// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/argumentmodels/MerchantDetailArguments.dart';

import 'home_models.dart';
import '../../network/models/merchant_models.dart';

class MainModel extends ChangeNotifier {
  final MainRepository repository;

  List<CuisineListItem> _cuisines = List();
  List<String> _carousel = List();
  List<MerchantDetail> _cafes = List();

  UnmodifiableListView<CuisineListItem> get cuisines =>
      UnmodifiableListView(_cuisines);

  UnmodifiableListView<String> get carousel => UnmodifiableListView(_carousel);
  UnmodifiableListView<MerchantDetail> get cafes => UnmodifiableListView(_cafes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MainModel({
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

    return repository.loadCafesItems().then((cafes) {
      _cafes.addAll(cafes);
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }

  void onAllCafesClick(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.merchantList);
  }

  void onCafeItemClick(BuildContext context, String merchantId, String title) {
    Navigator.pushNamed(context, AppRoutes.merchantDetail, arguments: MerchantDetailArguments(merchantId, "", title));
  }
}
