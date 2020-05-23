import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            pathImage: 'assets/img/cachapa-con-queso.jpg',
            iconData: Icons.favorite_border,
            left: 20,
            height: 350,
            width: 250,
          ),
          CardImageWithFabIcon(
            pathImage: 'assets/img/chisteone.jpg',
            iconData: Icons.favorite_border,
            left: 20,
            height: 350,
            width: 250,
          ),
          CardImageWithFabIcon(
            pathImage: 'assets/img/logojetbrain.png',
            iconData: Icons.favorite_border,
            left: 20,
            height: 350,
            width: 250,
          ),
        ],
      ),
    );
  }

}