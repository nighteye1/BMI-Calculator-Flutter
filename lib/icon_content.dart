import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget{


  final IconData genderIcon;
  final String genderLabel;

  IconContent({this.genderLabel, this.genderIcon});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderLabel,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}