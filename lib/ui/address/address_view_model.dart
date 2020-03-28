// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/repository/main_repository.dart';

enum AddressViewType {
  List,
  Add
}

class AddressViewModel extends ChangeNotifier {
  final MainRepository repository;
  List<Address> data = List();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AddressViewModel({@required this.repository});

  TextEditingController cityTextEditingController = new TextEditingController();
  TextEditingController regionTextEditingController =
      new TextEditingController();
  TextEditingController districtTextEditingController =
      new TextEditingController();
  TextEditingController streetTextEditingController =
      new TextEditingController();
  TextEditingController houseTextEditingController =
      new TextEditingController();
  TextEditingController apartmentTextEditingController =
      new TextEditingController();
  TextEditingController phoneTextEditingController =
      new TextEditingController();

  AddressViewType currentViewState = AddressViewType.List;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadAddress();
  }

  void _loadAddress() {
    _isLoading = true;
    notifyListeners();
    repository.getAddresses().then((value) {
      data.clear();
      data.addAll(value);
      _isLoading = false;
      notifyListeners();
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
    });
  }

  void onAddAddressClick(BuildContext context) {
    currentViewState = AddressViewType.Add;
    Navigator.pushNamed(context, AppRoutes.addAddress).then((value) {
      _loadAddress();
      currentViewState = AddressViewType.List;
    });
    notifyListeners();
  }

  void onSaveAddressClick(BuildContext context) {
    Navigator.pop(context, "success");
    notifyListeners();
  }
}
