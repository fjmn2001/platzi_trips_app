import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Review(
          'assets/img/avatar.png',
          'Francisco Marcano',
          '1 review 5 photos',
          'It is a amazing plase'
        ),
        new Review(
          'assets/img/avatar.png',
          'Francisco Marcano',
          '1 review 5 photos',
          'It is a amazing plase'
        ),
        new Review(
          'assets/img/avatar.png',
          'Francisco Marcano',
          '1 review 5 photos',
          'It is a amazing plase'
        ),
      ],
    );
  }

}