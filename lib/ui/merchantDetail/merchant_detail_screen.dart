import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/argumentmodels/MerchantDetailArguments.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_model.dart';

class MerchantDetailScreen extends StatefulWidget {
  final Widget child;

  const MerchantDetailScreen(this.child);

  @override
  _MerchantDetailScreen createState() => _MerchantDetailScreen();
}

class _MerchantDetailScreen extends State<MerchantDetailScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MerchantDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: ChangeNotifierProvider<MerchantDetailModel>(
        create: (context) {
          var model = GetIt.instance<MerchantDetailModel>();
          model.merchantId = args.merchantId;
          return model;
        },
        child: widget.child,
      ),
    );
  }
}
