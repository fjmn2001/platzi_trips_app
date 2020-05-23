import 'package:flutter/cupertino.dart';
import 'package:platzitripsapp/Place/model/place.dart';

class User {
  String uid;
  String name;
  String email;
  String photoURL;
  List<Place> myPlaces;
  List<Place> myFavoritePlaces;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
  });
}