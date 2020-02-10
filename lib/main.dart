import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/app.dart';
import 'package:vsem_edu/network/web_service.dart';
import 'package:vsem_edu/repository/main_repository.dart';

Future<void> main() async {

  WebService _webService = WebService();
  _webService.initClient();

  runApp(ProviderApp(
    repository: MainRepository(_webService),
    httpClient: _webService,
  ));
}