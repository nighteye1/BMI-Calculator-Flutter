import 'package:bmi_calculator/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results.dart';
import 'calculator_brain.dart';



enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int feet = 4;
  int inches = 0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        bgcolor: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                          genderLabel: 'MALE',
                          genderIcon: FontAwesomeIcons.mars)
                    ),
                ),
                Expanded(
                    child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        bgcolor: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                            genderLabel: 'FEMALE',
                            genderIcon: FontAwesomeIcons.venus)
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(bgcolor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RoundIconButton(
                          child: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if(feet - 1 < 1){
                                feet = 1;
                              }
                              else{
                                feet --;
                              }
                            });
                          },
                        ),
                        Text(
                            '$feet\'',
                              style: kNumberStyle,
                        ),
                        RoundIconButton(
                           child: FontAwesomeIcons.plus,
                          onPressed: (){
                             setState(() {
                               if(feet + 1 > 10){
                                 feet = 10;
                               }
                               else{
                                 feet++;
                               }
                             });
                          },
                        )

                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            child: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                if(inches - 1 < 0){
                                  inches = 0;
                                }
                                else{
                                  inches --;
                                }
                              });
                            },
                          ),
                          Text('$inches\"',style: kNumberStyle),
                          RoundIconButton(
                            child: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                if(inches + 1 > 11){
                                  inches = 11;
                                }
                                else{
                                  inches ++;
                                }

                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        bgcolor: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      weight --;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      weight ++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],

                        )),
                ),
                Expanded(
                    child: ReusableCard(
                        bgcolor: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                ),
              ],
            ),
          ),
          BottomButton(option: 'CALCULATE',
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain (height: (feet*12) + inches, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute (
                      builder: (context) => ResultsPage(
                        results: calculatorBrain.calculateBMI(),
                        bodyType: calculatorBrain.getResults(),
                        instructions: calculatorBrain.getInstructions(),
                      )
                    ) );
              },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({this.option, this.onTap});

  final String option;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          color: Color(0xFF00d4de),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                option,
                style: kNumberStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget{
  RoundIconButton({@required this.child, @required this.onPressed});

  final IconData child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}





