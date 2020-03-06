// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/globals.dart';
import 'package:vsem_edu/network/models/create_account_response.dart';
import 'package:vsem_edu/repository/main_repository.dart';

class CodeViewModel extends ChangeNotifier {
  final MainRepository repository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  TextEditingController codeController = TextEditingController();

  String codeError;

  CodeViewModel({
    @required this.repository
  });

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  void onRegBtnClick(BuildContext context, CreateAccountResponse arguments) {
    repository.verifyCode(codeController.text, arguments.customerToken).then((value) {
      Globals.getInstance().saveToken(value.token);
      Navigator.pushNamed(context, AppRoutes.home);
    });
  }

  String _getEmptyErrorText() {
    return "Поле не может быть пустым";
  }

  void sendCode() {

  }

}
