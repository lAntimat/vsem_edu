import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/ui/login/codescreen/code_view_model.dart';
import 'package:vsem_edu/ui/login/register_view_model.dart';

class CodeScreen extends StatefulWidget {
  final Widget child;

  const CodeScreen(this.child);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<CodeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<CodeViewModel>(
        create: (context) => GetIt.instance<CodeViewModel>(),
        child: widget.child,
      ),
    );
  }
}
