import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsem_edu/common/app_colors.dart';

class ItemPicker extends StatefulWidget {
  int count = 0;


  ItemPicker({this.count});

  @override
  _ItemPickerState createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        btn(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (widget.count > 0) widget.count--;
              });
            }),
        Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.blackText),
                bottom: BorderSide(color: AppColors.blackText),
              ),
            ),
            width: 30,
            height: 30,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.count.toString(),
                  style: TextStyle(fontSize: 18, color: AppColors.blackText),
                ))),
        btn(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.count++;
              });
            }),
      ],
    ));
  }

  Widget btn({Icon icon, VoidCallback onPressed}) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(border: Border.all(color: AppColors.blackText)),
      child: IconButton(
        color: Color(0xFFe25100),
        iconSize: 14,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
