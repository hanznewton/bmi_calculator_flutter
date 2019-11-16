import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/customCard.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.yourResults,
      @required this.yourInterpretation,
      @required this.yourBMI});

  final String yourResults;
  final String yourBMI;
  final String yourInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RESULTS',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              //alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    yourResults.toUpperCase(),
                    style: kResultsTextStyle,
                  ),
                  Text(
                    yourBMI,
                    style: kBMITextStyle,
                  ),
                  Text(
                    yourInterpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              buttonTitle: 'RE-CALCULATE BMI',
              onTap: () {
                Navigator.pop(context);
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return InputPage();
//                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
