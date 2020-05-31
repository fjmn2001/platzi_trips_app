import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  double width = 350;
  double height = 250;
  double left = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            file: File('assets/img/cachapa-con-queso.jpg'),
            iconData: Icons.favorite_border,
            left: left,
            height: height,
            width: width,
          ),
          CardImageWithFabIcon(
            file: File('assets/img/chisteone.jpg'),
            iconData: Icons.favorite_border,
            left: left,
            height: height,
            width: width,
          ),
          CardImageWithFabIcon(
            file: File('assets/img/logojetbrain.png'),
            iconData: Icons.favorite_border,
            left: left,
            height: height,
            width: width,
          ),
        ],
      ),
    );
  }

}