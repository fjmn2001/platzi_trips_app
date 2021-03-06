import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzitripsapp/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double left;
  String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  bool internet = true;

  CardImageWithFabIcon({
    Key key,
    @required this.height,
    @required this.width,
    @required this.left,
    @required this.pathImage,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.internet
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: internet
                //? NetworkImage(pathImage)//CachedNetworkImageProvider(pathImage)
                ? CachedNetworkImageProvider(pathImage)
                : AssetImage(pathImage)
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
