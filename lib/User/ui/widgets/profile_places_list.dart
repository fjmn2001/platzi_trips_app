import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_place.dart';

class ProfilePlacesList extends StatelessWidget {

  Place place = Place(
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    likes: 123,
    urlImage: 'https://yt3.ggpht.com/a/AATXAJz14ZPzRqz3EJ2VvEdsUahT2Gt77bB9N5Q6gQ=s900-c-k-c0xffffffff-no-rj-mo'
  );

  Place place2 = Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    likes: 321,
    urlImage: 'https://yt3.ggpht.com/a/AATXAJz14ZPzRqz3EJ2VvEdsUahT2Gt77bB9N5Q6gQ=s900-c-k-c0xffffffff-no-rj-mo'
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }

}