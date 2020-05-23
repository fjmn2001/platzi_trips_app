import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/Place/ui/widgets/text_input_location.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';
import 'package:platzitripsapp/widgets/text_input.dart';
import 'package:platzitripsapp/widgets/title_header.dart';

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
    final TextEditingController _titlePlace = TextEditingController();
    final TextEditingController _descriptionPlace = TextEditingController();
    final TextEditingController _locationPlace = TextEditingController();

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
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                  child: TitleHeader(title: 'Add a new place',),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    //pathImage: widget.image.path,
                    pathImage: 'assets/img/logojetbrain.png',
                    iconData: Icons.camera_alt,
                    left: 20,
                    height: 250,
                    width: 350,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: TextInput(
                    hintText: 'Title',
                    textInputType: null,
                    maxLines: 1,
                    controller: _titlePlace,
                  ),
                ),
                Container(
                  child: TextInput(
                    hintText: 'Description',
                    textInputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _descriptionPlace,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                    hintText: 'Add location',
                    controller: _locationPlace,
                    iconData: Icons.location_on
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}