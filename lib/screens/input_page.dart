import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_contant.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/RoundActionButton.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';
enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _height = 100;
  int weight = 10;
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090c22),
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Reuseble(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  color: selectedGender == Gender.Male
                      ? kactivecolor
                      : kinactivecardcolor,
                  cardchild:
                      IconContain(icon: FontAwesomeIcons.mars, label: 'MALE'),
                ),
              ),
              Expanded(
                child: Reuseble(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  color: selectedGender == Gender.Female
                      ? kactivecolor
                      : kinactivecardcolor,
                  cardchild: IconContain(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                ),
              ),
            ],
          )),
          Expanded(
            child: Reuseble(
              color: kactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: knumbertextstyle,
                      ),
                      Text(
                        'cm',
                        style: klabelstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 100,
                      max: 200,
                      // activeColor: Color(0xFFEB1555),
                      // inactiveColor: Color(0xFF8D8E98),
                      //   divisions: 6,
                      // label: _height.round().toString(),
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseble(
                    color: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelstyle,
                        ),
                        Text(
                          _age.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseble(
                    color: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottom_button(
            title: 'CALCULATE',
            ontap: (
                ) {
              CalculatorBrain cal=CalculatorBrain(weight: weight,height: _height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiresult: cal.calculator(),
                    interpretation: cal.getInterpretation(),
                    resulttext: cal.GetResults(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
