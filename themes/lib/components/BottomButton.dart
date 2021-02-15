import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTab;
  final String buttonTitle;

  BottomButton({@required this.buttonTitle, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Color(0xffEB1555),
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
