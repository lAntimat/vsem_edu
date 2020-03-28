import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_model.dart';

class MerchantListScreen extends StatefulWidget {
  final Widget child;

  const MerchantListScreen(this.child);

  @override
  _MerchantListScreen createState() => _MerchantListScreen();
}

class _MerchantListScreen extends State<MerchantListScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Заведения"),
      ),
      body: ChangeNotifierProvider<MerchantListModel>(
        create: (context) => GetIt.instance<MerchantListModel>(),
        child: widget.child,
      ),
    );
  }
}
