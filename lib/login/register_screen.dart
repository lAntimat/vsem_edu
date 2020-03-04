import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/login/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  final Widget child;

  const RegisterScreen(this.child);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => GetIt.instance<RegisterViewModel>(),
        child: widget.child,
      ),
    );
  }
}
