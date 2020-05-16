import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage('assets/img/cachapa-con-queso.jpg'),
          CardImage('assets/img/chisteone.jpg'),
          CardImage('assets/img/logojetbrain.png'),
        ],
      ),
    );
  }

}