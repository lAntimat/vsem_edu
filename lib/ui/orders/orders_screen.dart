import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/basket/basket_view_model.dart';
import 'package:vsem_edu/ui/orders/orders_view_model.dart';

class OrdersScreen extends StatefulWidget {
  final Widget child;

  const OrdersScreen(this.child);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои заказы"),
      ),
      body: ChangeNotifierProvider<OrdersViewModel>(
        create: (context) {
          var model = GetIt.instance<OrdersViewModel>();
          return model;
          },
        child: widget.child,
      ),
    );
  }
}
