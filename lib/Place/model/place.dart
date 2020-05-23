import 'package:flutter/cupertino.dart';
import 'package:platzitripsapp/User/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    this.userOwner
  });
}