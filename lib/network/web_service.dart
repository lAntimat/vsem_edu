import 'dart:async';

import 'package:dio/dio.dart';
import 'package:vsem_edu/common/uuid.dart';
import 'package:vsem_edu/network/webservice_response.dart';

import '../globals.dart';


enum HttpRequest { Get, Post, Head, Update, PostFormData }

const int DefaultTimeoutInSeconds = 30;

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
    "device_uiid" : Uuid().generateV4(),
    "api_key": "apikeydeliverycube",
    "lang": "ru"
  };

  Options _defaultOptions;
  Dio _dio;

  String _apiEndpoint = "https://cheglok.ru/mobileappv2/";

  // NOTE: Add or remove endpoints required
  String _getCuisinesEndpoint = "api/cuisineList";
  String _getSettingsEndpoint = "api/getSettings";

  void initClient() {
    _dio = new Dio(); // with default Options

    // Set default configs
    //dio.options.baseUrl = apiEndpoint2;
    //dio.patch(apiEndpoint2);
    _dio.options.connectTimeout = 10000; //30s
    _dio.options.receiveTimeout = 10000;
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));

    _defaultOptions = Options(headers: {
      "Authorization-Token": Globals.getInstance().token,
    });

    _dio.options.headers = _defaultOptions.headers;
  }

  void addTokenToHeaders(String token) {
    _defaultOptions.headers["Authorization-Token"] = token;
  }

  Future<WebServiceResponse> getCuisines() async {
    var response = await _dio.get(
      _apiEndpoint + _getCuisinesEndpoint,
      queryParameters: _defaultParams
    );
    return WebServiceResponse.fromDioResponse(response);
  }

  Future<WebServiceResponse> getCarousel() async {
    var response = await _dio.get(
        _apiEndpoint + _getSettingsEndpoint,
        queryParameters: _defaultParams
    );
    return WebServiceResponse.fromDioResponse(response);
  }
}
