import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class WebServiceResponse {
  final String body;

  Map<String, String> headers;
  Headers dioHeaders;

  final int statusCode;

  bool get hasError {
    if (statusCode > 399) return true;
    if (json.decode(body)['result'] == 'error') return true;

    return false;
  }

  WebServiceResponse({this.body, this.headers, this.statusCode});

  WebServiceResponse.emptySuccess()
      : body = '{}',
        headers = {},
        statusCode = 200;

  WebServiceResponse.fromDioResponse(Response<dynamic> response)
      : body = response.data,
        dioHeaders = response.headers,
        statusCode = response.statusCode;
}
