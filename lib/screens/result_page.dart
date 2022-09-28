import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiresult,this.interpretation,this.resulttext});

  final String? bmiresult;
final String? resulttext;
final String? interpretation;


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitletextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseble(
              color: kactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext!,
                    style: kResultTextstyle,
                  ),
                  Text(
                    bmiresult!,
                    style: kBmiTextstyle,
                  ),
                  Text(
                    interpretation!,
                    style: kBodyTextstyle,
                  ),
                ],
              ),
            ),
          ),
          Bottom_button(
            title: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
