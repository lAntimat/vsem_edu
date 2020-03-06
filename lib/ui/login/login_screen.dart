import 'package:flutter/material.dart' hide Action;

class LoginScreen extends StatefulWidget {
  final Widget child;

  const LoginScreen(this.child);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
