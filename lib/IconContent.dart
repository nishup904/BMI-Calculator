import 'package:flutter/material.dart';
class iconContent extends StatelessWidget {
  final String? label;
  final IconData? icon;
  iconContent({this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height:15.0,
        ),
        Text(label.toString(),
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),)
      ],
    );
  }
}
