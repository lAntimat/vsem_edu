import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/ui/address/address_view_model.dart';

class AddressScreen extends StatefulWidget {
  final Widget child;

  const AddressScreen(this.child);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  AddressViewModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Адреса"),
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
            _model.onAddAddressClick(context);
          },
          label: Text(
            "Добавить адрес", style: TextStyle(color: AppColors.white),)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
