import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget{
  File image;

  AddPlaceScreen({
    Key key,
    @required this.image
  });

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300,),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}