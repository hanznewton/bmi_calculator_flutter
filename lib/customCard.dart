import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.colour, this.childWidget, this.onPress});
  final Color colour;

  final Widget childWidget;

  final Function onPress;

  //@required means the value for colour is required when calling the
  // constructor.

  //if you are actually using the other method which is defining the
  // constructor property inside the constructor before asigning it
  // to this.colour, the using the final keyword will really pose problems
  // because you will be asked to initialize your colour first before you use
  // it, and it won't also be able to intialize because it is final.

  // so the best way is just to asign the value of the constructor while
  // initializing the constructor in the section where it is called.
  // which is what we have just done above.

  /*
  other wise, it was gonna be something like.

  Color colour;
  ReusableContainer({@required Color colour}){
        this.colour = colour;

   in which case the variable colour is not final.
  }
   */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWidget,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
