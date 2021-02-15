import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color colour;
  final Function onPress;

  ReusableCard({this.cardChild, this.colour, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
