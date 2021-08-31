import 'package:flutter/material.dart';

class ButtonForCalc extends StatelessWidget {
var background, text, textColor;
final Function func;
ButtonForCalc({this.background=Colors.black12,this.text, this.textColor=Colors.white,required this.func });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: background,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 15)),
      onPressed: () {
        func(text);
      },
      heroTag: null,
    );
  }
}
