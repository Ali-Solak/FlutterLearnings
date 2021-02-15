import 'package:flutter/material.dart';

import '../constants/constants.dart';

class IconContents extends StatelessWidget {
  final Widget icon;
  final String text;

  IconContents({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
