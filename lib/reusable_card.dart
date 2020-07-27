import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget{

  ReusableCard({this.bgcolor, this.cardChild, this.onPress});

  final Color bgcolor;
  final Widget cardChild;

  final Function onPress;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}