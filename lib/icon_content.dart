import 'package:flutter/material.dart';
import 'constants.dart';

class ColumnItems extends StatelessWidget {
  ColumnItems({@required this.customIcon, @required this.customText});

  final IconData customIcon;
  final String customText;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            customIcon,
            size: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            customText,
            style: kTextStyle,
          ),
        ]);
  }
}
