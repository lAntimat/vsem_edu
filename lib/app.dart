// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/common/theme.dart';
import 'package:vsem_edu/network/web_service.dart';
import 'package:vsem_edu/repository/main_repository.dart';

import 'home/home_screen.dart';
import 'home/todo_list_model.dart';

class ProviderApp extends StatelessWidget {
  final MainRepository repository;
  final WebService httpClient;

  ProviderApp({
    @required this.repository,
    @required this.httpClient
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(repository: repository),
      child: MaterialApp(
        theme: AppTheme.theme,
        routes: {
          AppRoutes.home: (context) => HomeScreen(),
          AppRoutes.addTodo: (context) => HomeScreen(),
        },
      ),
    );
  }
}
