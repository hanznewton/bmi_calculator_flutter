import 'package:bmi_calculator_flutter/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customCard.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
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
  /*
this method below uses if and else statements,
we have optimized it below using ternary operators.
 */

//  Color maleColor = inactiveCardColor;
//  Color femaleColor = inactiveCardColor;

//  void updateColor(Gender gender) {
//    if (gender == Gender.male) {
//      if (maleColor == inactiveCardColor) {
//        maleColor = activeCardColor;
//        femaleColor = inactiveCardColor;
//      } else {
//        maleColor = inactiveCardColor;
//        //femaleColor = activeCardColor;
//      }
//    } else if (gender == Gender.female) {
//      if (femaleColor == inactiveCardColor) {
//        femaleColor = activeCardColor;
//        maleColor = inactiveCardColor;
//      } else {
//        femaleColor = inactiveCardColor;
//        //maleColor = activeCardColor;
//      }
//    }
//  gender == Gender.male ? {maleColor == inactiveCardColor ? {maleColor = activeCardColor; femaleColor
//  = inactiveCardColor;} : maleColor = inactiveCardColor } : {femaleColor == inactiveCardColor ?
//  {femaleColor = activeCardColor; maleColor = inactiveCardColor}};
//  }

  Gender selectedGender;
  int height = 180;
  int weight = 50;
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
                    child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childWidget: ColumnItems(
                        customIcon: FontAwesomeIcons.mars,
                        customText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      childWidget: ColumnItems(
                        customIcon: FontAwesomeIcons.venus,
                        customText: 'FEMALE',
                      ),
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableContainer(
                colour: kActiveCardColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                            height.toString()
                            /* or'$sliderValue'*/,
                            style: kTextStyleBold),
                        Text('cm', style: kTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x25eb1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,

                        /*
                        without granular customization from the SliderTheme
                        widget, we can allow the below lines as is,
                        to set the activeColor and the inactiveColor of our
                        slider
                         */
                        //activeColor: Color(0xffeb1555),
                        //inactiveColor: Color(0xff8d8e98),
                        onChanged: (double newSliderValue) {
                          setState(() {
                            height = newSliderValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContainer(
                      colour: kActiveCardColor,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(weight.toString(), style: kTextStyleBold),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                onPressed: () {
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
                  Expanded(
                    child: ReusableContainer(
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(age.toString(), style: kTextStyleBold),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                    yourBMI: calc.calculateBMI(),
                    yourResults: calc.getResult(),
                    yourInterpretation: calc.interpretation(),
                  );
                }));
              },
              buttonTitle: 'CALCULATE',
            )
          ],
        )

/*
Below we can change the theme for particular elements in our app
by wrapping them round the theme widget and customizing them
This give more granular control over certain sections of our app.
 */
//      floatingActionButton: Theme(
//        data: ThemeData.light(),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
        );
  }
}

/*
    We build a new custom button type for our buttons to be used
    in the weight incrementation.
 */

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.child, @required this.onPressed});

  final IconData child;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),

      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      // RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)));
      fillColor: Color(0xff4c4f5e),
      elevation: 10.0,
      onPressed: onPressed,

      // RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)));
    );
  }
}
