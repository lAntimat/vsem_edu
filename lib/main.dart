import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/app.dart';
import 'package:vsem_edu/network/web_service.dart';
import 'package:vsem_edu/repository/main_repository.dart';

import 'globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Globals.getInstance().init();
  await Globals.getInstance().getToken();
  WebService _webService = WebService.getInstance();
  _webService.initClient();


  runApp(ProviderApp(
    repository: MainRepository(_webService),
    httpClient: _webService,
  ));
}