// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/common/theme.dart';
import 'package:vsem_edu/network/web_service.dart';
import 'package:vsem_edu/repository/main_repository.dart';
import 'package:vsem_edu/ui/basket/basket_screen.dart';
import 'package:vsem_edu/ui/basket/basket_view.dart';
import 'package:vsem_edu/ui/basket/basket_view_model.dart';
import 'package:vsem_edu/ui/home/base_screen.dart';
import 'package:vsem_edu/ui/home/main_model.dart';
import 'package:vsem_edu/ui/home/main_view.dart';
import 'package:vsem_edu/ui/login/codescreen/code_screen.dart';
import 'package:vsem_edu/ui/login/codescreen/code_view.dart';
import 'package:vsem_edu/ui/login/codescreen/code_view_model.dart';
import 'package:vsem_edu/ui/login/login_screen.dart';
import 'package:vsem_edu/ui/login/login_view.dart';
import 'package:vsem_edu/ui/login/login_view_model.dart';
import 'package:vsem_edu/ui/login/register_screen.dart';
import 'package:vsem_edu/ui/login/register_view.dart';
import 'package:vsem_edu/ui/login/register_view_model.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_screen.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_view.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_model.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_screen.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_view.dart';
import 'package:vsem_edu/ui/profile/profile_screen.dart';
import 'package:vsem_edu/ui/profile/profile_view.dart';
import 'package:vsem_edu/ui/profile/profile_view_model.dart';


class ProviderApp extends StatelessWidget {
  final MainRepository repository;
  final WebService httpClient;

  ProviderApp({
    @required this.repository,
    @required this.httpClient
  }) {
   setupLocators();
  }

  void setupLocators() {
    GetIt.instance.registerFactory<MerchantListModel>(() => MerchantListModel(repository: repository));
    GetIt.instance.registerFactory<MainModel>(() => MainModel(repository: repository));
    GetIt.instance.registerFactory<LoginViewModel>(() => LoginViewModel(repository: repository));
    GetIt.instance.registerFactory<RegisterViewModel>(() => RegisterViewModel(repository: repository));
    GetIt.instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(repository: repository));
    GetIt.instance.registerFactory<BasketViewModel>(() => BasketViewModel(repository: repository));
    GetIt.instance.registerFactory<CodeViewModel>(() => CodeViewModel(repository: repository));
    GetIt.instance.registerFactory<MerchantDetailModel>(() => MerchantDetailModel(repository: repository));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      routes: {
        AppRoutes.home: (context) => BaseScreen(MainView()),
        AppRoutes.merchantList: (context) => MerchantListScreen(MerchantListView()),
        AppRoutes.login: (context) => LoginScreen(LoginView()),
        AppRoutes.auth: (context) => RegisterScreen(RegisterView()),
        AppRoutes.profile: (context) => ProfileScreen(ProfileView()),
        AppRoutes.basket: (context) => BasketScreen(BasketView()),
        AppRoutes.code: (context) => CodeScreen(CodeView()),
        AppRoutes.merchantDetail: (context) => MerchantDetailScreen(MerchantDetailView()),
      },
    );
  }
}
