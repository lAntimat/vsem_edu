import 'package:flutter/widgets.dart';

class GradientContainer extends StatelessWidget {

  Widget child;

  GradientContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Color(0xFF7517c5), Color(0xFFe25001)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: child,
    );
  }
}
