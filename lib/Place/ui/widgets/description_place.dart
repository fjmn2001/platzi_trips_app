import 'package:flutter/material.dart';
import 'package:platzitripsapp/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  String descriptionPlace;
  int stars;

  DescriptionPlace(this.namePlace, this.descriptionPlace, this.stars);

  @override
  Widget build(BuildContext context) {

    final star = Container(
      margin: EdgeInsets.only(
        top: 323,
        right: 3
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
          top: 323,
          right: 3
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      ),
    );

    final star_half = Container(
      margin: EdgeInsets.only(
          top: 323,
          right: 3
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320,
            left: 20,
            right: 20
          ),
          child: Text(
            this.namePlace,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 30,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star_half,
            star_border
          ],
        )
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20
      ),
      child: Text(
        this.descriptionPlace,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a)
        )
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        ButtonPurple(buttonText: 'Navigate', onPressed: () {},)
      ],
    );
  }
}