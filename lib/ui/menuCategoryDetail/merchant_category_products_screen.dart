import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/argumentmodels/MerchantDetailArguments.dart';
import 'package:vsem_edu/ui/menuCategoryDetail/merchant_category_products_model.dart';
import 'package:vsem_edu/ui/merchantDetail/merchant_detail_model.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_model.dart';

class MerchantCategoryProductScreen extends StatefulWidget {
  final Widget child;

  const MerchantCategoryProductScreen(this.child);

  @override
  _MerchantDetailScreen createState() => _MerchantDetailScreen();
}

class _MerchantDetailScreen extends State<MerchantCategoryProductScreen> {
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
      body: ChangeNotifierProvider<MerchantCategoryProductsModel>(
        create: (context) {
          var model = GetIt.instance<MerchantCategoryProductsModel>();
          model.merchantId = args.merchantId;
          model.categoryId = args.categoryId;
          return model;
        },
        child: widget.child,
      ),
    );
  }
}
