// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/home/home_models.dart';
import 'package:vsem_edu/repository/main_repository.dart';

enum VisibilityFilter { all, active, completed }

class MainModel extends ChangeNotifier {
  final MainRepository repository;

  VisibilityFilter _filter;

  VisibilityFilter get filter => _filter;

  set filter(VisibilityFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  List<CuisineListItem> _cuisines;

  UnmodifiableListView<CuisineListItem> get cuisines => UnmodifiableListView(_cuisines);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MainModel({
    @required this.repository,
    VisibilityFilter filter,
    List<CuisineListItem> cuisines,
  })  : _cuisines = cuisines ?? [],
        _filter = filter ?? VisibilityFilter.all;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadCuisines();
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
}
