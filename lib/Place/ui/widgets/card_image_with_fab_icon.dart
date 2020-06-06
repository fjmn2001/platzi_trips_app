import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzitripsapp/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double left;
  File file;
  String urlImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  ImageProvider image;

  CardImageWithFabIcon({
    Key key,
    @required this.height,
    @required this.width,
    @required this.left,
    this.file,
    this.urlImage,
    @required this.onPressedFabIcon,
    @required this.iconData
  });

  @override
  Widget build(BuildContext context) {

    if(this.urlImage != null) {
      this.image = NetworkImage(this.urlImage);
    } else if(this.file != null) {
      this.image = FileImage(this.file);
    }

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            //image: FileImage(file),
            image: image
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7)
          )
        ]
      ),
    );
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
