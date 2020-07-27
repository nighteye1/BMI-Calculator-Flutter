import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI(){
    _bmi = weight / pow(height * 0.0254, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInstructions() {
    if (_bmi >= 25){
      return 'You should do more exercise!';
    } else if (_bmi > 18.5) {
      return 'You have a good BMI! Good Job :)';
    }
    else{
      return 'You need to eat a bit more!';
    }
  }
}