import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget simpleFilledButton(
    {@required String text,
    @required VoidCallback onPressed,
    Color color = const Color(0xFFed8100)}) {

  return FlatButton(
    onPressed: onPressed,
    child: Text(
      text,
      maxLines: 1,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      overflow: TextOverflow.ellipsis,
    ),
    textColor: Colors.white,
    color: color,
    padding:
        EdgeInsetsDirectional.only(start: 10, end: 10, top: 10, bottom: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

Widget simpleOutlineButton(
    {text: String, color: Color, @required VoidCallback onPressed}) {
  var defaultColor = new Color(0xFFF88137);
  if (color != null) defaultColor = color;

  return OutlineButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 14),
      overflow: TextOverflow.clip,
    ),
    textColor: defaultColor,
    color: defaultColor,
    disabledBorderColor: defaultColor,
    borderSide: BorderSide(color: defaultColor),
    padding:
        EdgeInsetsDirectional.only(start: 10, end: 10, top: 20, bottom: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

Widget buttonTransparentBg(String text, {@required VoidCallback onPressed}) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 14, decoration: TextDecoration.underline),
      overflow: TextOverflow.clip,
    ),
    textColor: Colors.white,
    borderSide: BorderSide(color: Colors.transparent),
    highlightedBorderColor: Colors.transparent,
    padding:
        EdgeInsetsDirectional.only(start: 10, end: 10, top: 10, bottom: 10),
  );
}

Widget imageButton({iconData: IconData, Color color, VoidCallback onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Icon(
          iconData,
          color: color,
        ),
      ),
    ),
  );
}

Widget notificationBtn(int notificationCount, {VoidCallback onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 12, left: 20.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/ic_notification.svg",
              fit: BoxFit.cover,
            ),
            notificationCount != 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                    child: Container(
                      height: 14,
                      width: 14,
                      // Add box decoration
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color.fromARGB(51, 131, 100, 230))
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Color(0xFFf43f00),
                            Color(0xFFf43f00),
                          ],
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                                notificationCount < 10
                                    ? notificationCount.toString()
                                    : "9+",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          )),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ),
  );
}

Widget gradientFilledBtn(String text, {VoidCallback onPressed}) {
  return Container(
    height: 50,
    width: double.infinity,
    // Add box decoration
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Color.fromARGB(51, 131, 100, 230))],
      borderRadius: BorderRadius.circular(4.0),
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.18, 1.04],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Color(0xFFFFC062),
          Color(0xFFF88137),
        ],
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(text,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            )),
      ),
    ),
  );
}

Widget roundedBorderButton(
    {@required String text,
    @required VoidCallback onPressed,
    Color color,
    Color borderColor}) {
  if (color == null) color = Color(0xFFb63001);
  if (borderColor == null) borderColor = Color(0xFFFFFFFF);
  return Container(
    height: 58,
    width: double.infinity,
    // Add box decoration
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(color: Color.fromARGB(51, 131, 100, 230), spreadRadius: 4)
      ],
      border: Border.all(color: borderColor, width: 4),
      borderRadius: BorderRadius.circular(32.0),
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.3, 0.8],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Color(0xFFd43701),
          Color(0xFFac2e02),
        ],
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(text,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            )),
      ),
    ),
  );
}

Widget roundedFlatButton(
    {@required String text,
      @required VoidCallback onPressed,
      Color color,
      Color borderColor,
      double roundRadius = 10}) {
  if (color == null) color = Color(0xFFb63001);
  if (borderColor == null) borderColor = Color(0xFFFFFFFF);
  return Container(
    height: 50,
    width: 180,
    // Add box decoration
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(roundRadius),
      color: color
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(roundRadius),
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(text,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            )),
      ),
    ),
  );
}

Widget roundedRedButton(
    {@required String text,
    @required VoidCallback onPressed,
    Color color,
    Color borderColor,
    double roundRadius = 32}) {
  if (color == null) color = Color(0xFFb63001);
  if (borderColor == null) borderColor = Color(0xFFFFFFFF);
  return Container(
    height: 50,
    width: double.infinity,
    // Add box decoration
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: color.withAlpha(50), spreadRadius: 2)],
      borderRadius: BorderRadius.circular(roundRadius),
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.3, 0.8],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Color(0xFFd43701),
          Color(0xFFac2e02),
        ],
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(text,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            )),
      ),
    ),
  );
}

Widget roundedCyanBorderButton(
    {@required String text,
    @required VoidCallback onPressed,
    Color startColor,
    Color endColor}) {
  if (startColor == null) startColor = Color(0xFF04b38a);
  if (endColor == null) endColor = Color(0xFF1088a1);
  return Container(
    height: 58,
    width: double.infinity,
    // Add box decoration
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Color.fromARGB(51, 131, 100, 230))],
      borderRadius: BorderRadius.circular(32.0),
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          startColor,
          endColor,
        ],
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(text,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            )),
      ),
    ),
  );
}

Widget roundedOutlineButton(
    {text: String, color: Color, @required VoidCallback onPressed}) {
  var defaultColor = new Color(0xFFF88137);
  if (color != null) defaultColor = color;

  return OutlineButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      overflow: TextOverflow.clip,
    ),
    textColor: defaultColor,
    color: defaultColor,
    disabledBorderColor: defaultColor,
    borderSide: BorderSide(color: defaultColor),
    padding:
        EdgeInsetsDirectional.only(start: 10, end: 10, top: 18, bottom: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  );
}
