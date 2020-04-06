import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/cart/cart_view_model.dart';

class BasketScreen extends StatefulWidget {
  final Widget child;

  const BasketScreen(this.child);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина"),
      ),
      body: ChangeNotifierProvider<CartViewModel>(
        create: (context) => GetIt.instance<CartViewModel>(),
        child: widget.child,
      ),
    );
  }
}
