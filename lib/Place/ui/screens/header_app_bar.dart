import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_list.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack('Popular', 250),
        CardImageList()
      ],
    );
  }

}