import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:vsem_edu/home/ImageCarousel.dart';
import 'package:vsem_edu/home/home_models.dart';
import 'package:vsem_edu/home/merchant_models.dart';
import 'package:vsem_edu/network/web_service.dart';

class MainRepository {
  final WebService webService;

  MainRepository(this.webService);

  Future<List<CuisineListItem>> loadCuisine() async {
    return webService.getCuisines().then((value) {
      var data = Cuisine.fromJson(jsonDecode(value.body));
      return Future.value(data.details.list);
    });
  }

  Future<List<dynamic>> loadCarouselItems() async {
    return webService.getCarousel().then((value) {
      var data = ImageCarouselParent.fromJson(jsonDecode(value.body));
      return Future.value(data.urls);
    });
  }

  Future<List<MerchantDetail>> loadCafesItems() async {
    return webService.getMerchants().then((value) {
      var data = ResponseMerchant.fromJson(jsonDecode(value.body));
      return Future.value(data.details.list);
    });
  }
}
