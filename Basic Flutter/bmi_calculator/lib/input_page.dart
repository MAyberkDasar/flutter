import 'package:bmi_calculator/bottom_container_widget.dart';
import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/column_widget.dart';
import 'package:bmi_calculator/container_widget.dart';
import 'package:bmi_calculator/gender_type.dart';
import 'package:bmi_calculator/icon_buton.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color activeColor = const Color(0xFF1D1E33);
Color inactiveColor = const Color(0xFF111328);
Color bottomContainerColour = const Color(0xFFEB1555);
double bottomContainerHeight = 50;
Color maleContainerColor = const Color(0xFF111328);
Color femaleContainerColor = const Color(0xFF111328);
TextStyle numberTextStyle = const TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold,
);
TextStyle textTextStyle = const TextStyle(
  fontSize: 10,
  color: Color(0xFF8D8E98),
);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? gender;
  int userHeight = 170;
  int userWeight = 60;
  int userAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    onPress: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                    colour:
                        gender == GenderType.male ? activeColor : inactiveColor,
                    containerChild: const ColumnWidget(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    onPress: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    colour: gender == GenderType.female
                        ? activeColor
                        : inactiveColor,
                    containerChild: const ColumnWidget(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerWidget(
              colour: inactiveColor,
              containerChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: textTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          userHeight.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: textTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: userHeight.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          userHeight = newValue.toInt();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    colour: inactiveColor,
                    containerChild: Column(
                      children: [
                        Text(
                          "WEIGHT",
                          style: textTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButon(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButon(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    colour: inactiveColor,
                    containerChild: Column(
                      children: [
                        Text(
                          "AGE",
                          style: textTextStyle,
                        ),
                        Text(
                          userAge.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButon(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButon(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userAge++;
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
          BottomContainerWidget(
            buttonTitle: "CALCULATE",
            onTap: () {
              CalculateBmi calculateBmi =
                  CalculateBmi(height: userHeight, weight: userWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculateBmi.calculate(),
                      advice: calculateBmi.giveAdvice(),
                      resultText: calculateBmi.result(),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
