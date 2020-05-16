import 'package:flutter/cupertino.dart';

class User {
  String name;
  String email;
  String photoURL;

  User({
    Key key,
    @required this.name,
    @required this.email,
    @required this.photoURL
  });
}