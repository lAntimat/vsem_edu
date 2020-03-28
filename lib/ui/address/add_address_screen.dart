import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/ui/address/address_view_model.dart';

class AddAddressScreen extends StatefulWidget {
  final Widget child;

  const AddAddressScreen(this.child);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  AddressViewModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить адрес"),
      ),
      body: ChangeNotifierProvider<AddressViewModel>(
        create: (context) {
          _model = GetIt.instance<AddressViewModel>();
          return _model;
        },
        child: widget.child,
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.orange,
          onPressed: () {
            _model.onSaveAddressClick(context);
          },
          label: Text(
            "Сохранить", style: TextStyle(color: AppColors.white),)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
