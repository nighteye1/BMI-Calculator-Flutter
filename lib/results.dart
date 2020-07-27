

import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.results, @required this.bodyType, @required this.instructions});

  final String results;
  final String bodyType;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kNumberStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              bgcolor: Colors.white,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bodyType.toUpperCase(),
                    style: kResultStyle,
                  ),
                  Text(
                    results,
                    style: kBMItext,
                  ),
                  Text(
                    instructions,
                    textAlign: TextAlign.center,
                    style: kBodyText,
                  )
                ],
              ),
            ),
          ),
          BottomButton(option: 'RE CALCULATE',
              onTap: (){
                  Navigator.pop(context);
              }
            ),
        ],
      ),
    );
  }
}
