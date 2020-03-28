import 'dart:async';

import 'package:dio/dio.dart';
import 'package:vsem_edu/common/uuid.dart';
import 'package:vsem_edu/network/models/addressRequest.dart';
import 'package:vsem_edu/network/models/create_user_dto.dart';
import 'package:vsem_edu/network/webservice_response.dart';

import '../globals.dart';

class WebService {
  static WebService _instance;

  static WebService getInstance() {
    if (_instance == null) {
      _instance = WebService();
    }

    return _instance;
  }

  /// Add headers here that you would like to be added to all your
  /// requests.
  Map<String, String> _defaultParams = {
    "device_id": "deviceId",
    "device_platform": "mobile",
    "device_uiid": Uuid().generateV4(),
    "api_key": "apikeydeliverycube",
    "lang": "ru"
  };

  Options _defaultOptions;
  Dio _dio;

  String _apiEndpoint = "https://cheglok.ru/mobileappv2/";

  // NOTE: Add or remove endpoints required
  String _getCuisinesEndpoint = "api/cuisineList";
  String _getSettingsEndpoint = "api/getSettings";
  String _getMerchantsEndpoint = "api/searchMerchant";
  String _createAccountEndpoint = "api/createAccount";
  String _verifyCodeEndpoint = "api/verifyCode";
  String _customerLoginEndpoint = "api/customerLogin";
  String _getProfileEndpoint = "api/getProfile";
  String _getRestaurantInfoEndpoint = "api/getRestaurantInfo";
  String _getRestaurantMenuEndpoint = "api/getMerchantMenu";
  String _getMenuProductsEndpoint = "api/getItemByCategory";
  String _getOrdersEndpoint = "api/OrderList";
  String _getAddressesEndpoint = "api/AddressBookList";
  String _saveAddressEndpoint = "api/saveAddressBook";

  void initClient() {
    _dio = new Dio(); // with default Options

    // Set default configs
    //dio.options.baseUrl = apiEndpoint2;
    //dio.patch(apiEndpoint2);
    _dio.options.connectTimeout = 10000; //30s
    _dio.options.receiveTimeout = 10000;
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));

    Globals.getInstance().getToken().then((token) {
      if (token.isNotEmpty) {
        _defaultOptions = Options(headers: {
          "Authorization-Token": Globals.getInstance().token,
        });

        _dio.options.headers = _defaultOptions.headers;
      }
    });


  }

  void addTokenToHeaders(String token) {
    _defaultOptions = Options(headers: {"Authorization-Token": token});
    _dio.options.headers = _defaultOptions.headers;
  }

  Future<WebServiceResponse> getCuisines() async {
    var response = await _dio.get(_apiEndpoint + _getCuisinesEndpoint,
        queryParameters: _defaultParams);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getCarousel() async {
    var response = await _dio.get(_apiEndpoint + _getSettingsEndpoint,
        queryParameters: _defaultParams);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getMerchants() async {
    Map<String, String> params = Map.from(_defaultParams);
    params.addAll({
      "user_token": Globals.getInstance().token,
      "lat": "55.833511",
      "lng": "49.069439",
      "search_type": "byLatLong"
    });

    var response = await _dio.get(_apiEndpoint + _getMerchantsEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> createAccount(CreateUserDto createUserDto) async {
    Map<String, String> params = Map.from(_defaultParams);

    print(createUserDto.toJson());

    var response = await _dio.post(_apiEndpoint + _createAccountEndpoint,
        queryParameters: params,
        data: createUserDto.toJson(),
        options: Options(contentType: "application/x-www-form-urlencoded"));
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> verifyCode(String code, String token) async {
    Map<String, String> params = Map.from(_defaultParams);
    params.addAll({
      "code": code,
      "verification_type": "verification_mobile",
      "customer_token": token
    });

    var response = await _dio.get(_apiEndpoint + _verifyCodeEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> customerLogin(
      String login, String password) async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_mobile": login,
      "password": password,
    });

    var response = await _dio.get(_apiEndpoint + _customerLoginEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getProfile() async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
    });

    var response = await _dio.get(_apiEndpoint + _getProfileEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getRestaurantInfo(String merchantId) async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
      "merchant_id": merchantId,
    });

    var response = await _dio.get(_apiEndpoint + _getRestaurantInfoEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getMenu(String merchantId) async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
      "merchant_id": merchantId,
    });

    var response = await _dio.get(_apiEndpoint + _getRestaurantMenuEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getMenuProducts(String merchantId, String catId) async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
      "merchant_id": merchantId,
      "cat_id": catId,
    });

    var response = await _dio.get(_apiEndpoint + _getMenuProductsEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getOrders() async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
    });

    var response = await _dio.get(_apiEndpoint + _getOrdersEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getAddresses() async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
    });

    var response = await _dio.get(_apiEndpoint + _getAddressesEndpoint,
        queryParameters: params);
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> saveAddress(AddressRequest address) async {
    Map<String, String> params = Map.from(_defaultParams);

    params.addAll({
      "user_token": Globals.getInstance().token,
    });

    var response = await _dio.post(_apiEndpoint + _saveAddressEndpoint,
        queryParameters: params,
        data: address.toJson(),
        options: Options(contentType: "application/x-www-form-urlencoded"));
    return WebServiceResponse.fromDioResponse(response);
  }
}
