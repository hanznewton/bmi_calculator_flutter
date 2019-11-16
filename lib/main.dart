import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
/*
For the slider in our app, we may add this lines of slider theme data
to our theme, so that it can be applied over multiple pages in our app

          sliderTheme: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            thumbColor: Color(0xffeb1555),
            overlayColor: Color(0x25eb1555),
          ),

 */

          primaryColor: Color(0xff0a0e21),
          //accentColor: Colors.purple.shade900,

          /*
          This accentColor controls things like the floating action button.
           */
          scaffoldBackgroundColor: Color(0xff0a0e21)),
      home: InputPage(),
    );
  }
}
