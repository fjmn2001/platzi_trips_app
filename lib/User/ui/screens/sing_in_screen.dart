import 'package:flutter/material.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';

class SingInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingInScreen();
  }

}

class _SingInScreen extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return singInGoogleUI();
  }

  Widget singInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack('', null),
          Column(
            children: <Widget>[
              Text(
                'Welcome \n this is your travel app',
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}