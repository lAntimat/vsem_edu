import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/network/models/addressRequest.dart';
import 'package:vsem_edu/network/models/address_parent.dart';
import 'package:vsem_edu/network/models/base_response.dart';
import 'package:vsem_edu/network/models/create_account_response.dart';
import 'package:vsem_edu/network/models/create_user_dto.dart';
import 'package:vsem_edu/network/models/login_response.dart';
import 'package:vsem_edu/network/models/menu_category_items_parent.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';
import 'package:vsem_edu/network/models/menu_category_product_item_parent.dart';
import 'package:vsem_edu/network/models/merchant_models.dart';
import 'package:vsem_edu/network/models/order.dart';
import 'package:vsem_edu/network/models/orders_parent.dart';
import 'package:vsem_edu/network/models/points_parent.dart';
import 'package:vsem_edu/network/models/profile_response.dart';
import 'package:vsem_edu/network/models/restaurant_info_response.dart';
import 'package:vsem_edu/network/models/simple_response.dart';
import 'package:vsem_edu/network/models/verify_phone_response.dart';
import 'package:vsem_edu/network/web_service.dart';
import 'package:vsem_edu/ui/home/ImageCarousel.dart';
import 'package:vsem_edu/ui/home/home_models.dart';

class MainRepository {
  final WebService webService;

  MainRepository(this.webService);

  Future<List<CuisineListItem>> loadCuisine() async {
    return webService.getCuisines().then((value) {
      var data = Cuisine.fromJson(jsonDecode(value.body));
      return Future.value(data.details.list);
    });
  }

  Future<List<String>> loadCarouselItems() async {
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

  Future<CreateAccountResponse> createUser(CreateUserDto createUserDto) async {
    return webService.createAccount(createUserDto).then((value) {
      var data = CreateAccountResponse.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }

  Future<VerifyPhoneResponse> verifyCode(String code, String token) async {
    return webService.verifyCode(code, token).then((value) {
      var data = VerifyPhoneResponse.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }

  Future<LoginResponse> login(String login, String password) async {
    return webService.customerLogin(login, password).then((value) {
      var data = LoginResponse.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }

  Future<BaseResponse<ProfileResponse>> getProfile() async {
    return webService.getProfile().then((value) {
      var data = BaseResponse<ProfileResponse>.fromJson(jsonDecode(value.body));
      data.data = ProfileResponse.fromJson(data.dataJson);
      return Future.value(data);
    });
  }

  Future<BaseResponse<RestaurantInfoResponse>> getRestaurantInfo(
      String merchantId) async {
    return webService.getRestaurantInfo(merchantId).then((value) {
      var data =
          BaseResponse<RestaurantInfoResponse>.fromJson(jsonDecode(value.body));
      data.data = RestaurantInfoResponse.fromJson(data.dataJson);
      return Future.value(data);
    });
  }

  Future<MenuCategoryItemParent> getMenu(String merchantId) async {
    return webService.getMenu(merchantId).then((value) {
      var data = MenuCategoryItemParent.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }

  Future<List<MenuCategoryProductItem>> getMenuProducts(
      String merchantId, String catId) async {
    return webService.getMenuProducts(merchantId, catId).then((value) {
      var data = MenuCategoryProductItemParent.fromJson(jsonDecode(value.body));
      return Future.value(data.items);
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<MenuCategoryProductItem>> getBasket(
      String merchantId, String catId) async {
    return webService.getMenuProducts(merchantId, catId).then((value) {
      var data = MenuCategoryProductItemParent.fromJson(jsonDecode(value.body));
      return Future.value(data.items);
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<Order>> getOrders() async {
    return webService.getOrders().then((value) {
      var data = OrdersParent.fromJson(jsonDecode(value.body));
      return Future.value(data.items);
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<Address>> getAddresses() async {
    return webService.getAddresses().then((value) {
      var data = AddressParent.fromJson(jsonDecode(value.body));
      return Future.value(data.items);
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<Address>> saveAddress(AddressRequest address) async {
    return webService.saveAddress(address).then((value) {
      var data = AddressParent.fromJson(jsonDecode(value.body));
      return Future.value(data.items);
    }).catchError((error) {
      print(error);
    });
  }

  Future<PointsParent> getPoints() async {
    return webService.getPoints().then((value) {
      var data = PointsParent.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }

  Future<SimpleResponse> addToCart(
      {@required String categoryId,
      @required String itemId,
      @required String twoFlavors,
      @required String price,
      @required String notes,
      @required String qty}) async {
    return webService
        .addToCart(
            categoryId: categoryId,
            itemId: itemId,
            twoFlavors: twoFlavors,
            price: price,
            notes: notes,
            qty: qty)
        .then((value) {
      var data = SimpleResponse.fromJson(jsonDecode(value.body));
      return Future.value(data);
    });
  }
}
