import 'package:flutter/material.dart';

class Rounded_Button extends StatelessWidget {
  Rounded_Button({this.color,this.text,required this.onPressed});

  final Color? color;
  final String? text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => onPressed(),
          minWidth: 200.0,
          height: 52.0,
          child: Text(
            text!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
