
import 'dart:async';
import 'dart:core';

import 'package:vsem_edu/home/home_models.dart';

class MainRepository {

  Future<List<CuisineListItem>> loadCuisine() {
    return Future.value(List<CuisineListItem>(1));
  }

  // Persists todos to local disk and the web
  Future saveTodos(List<Null> todos) {
    return null;
  }
}
