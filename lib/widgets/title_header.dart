import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  String title;

  TitleHeader({
    Key key,
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
    );
  }

}