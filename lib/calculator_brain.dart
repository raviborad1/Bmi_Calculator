import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int? weight;
  final int? height;
  double? bmi;

  String calculator(){
     bmi= weight!/ pow(height!/100, 2);
    return bmi!.toStringAsFixed(2);
  }
  String GetResults(){
    if(bmi! >=25)
      return  'Overweight';

    else if(bmi! >18) {
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(bmi! >=25)
      return  'You have a higher than normal body weight. Try to exercise more:';

    else if(bmi! >18) {
      return 'You have a normal body weight. Good job!';
    }
    else{
      return  'You have a lower than normal body weight. you can eat a bit more:';
    }
  }
}