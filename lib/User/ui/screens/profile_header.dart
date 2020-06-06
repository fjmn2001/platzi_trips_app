import 'package:flutter/material.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/ui/widgets/button_bar.dart';
import 'package:platzitripsapp/User/ui/widgets/my_user_info.dart';

class ProfileHeader extends StatelessWidget {

  final User user;
  final title = Text(
    'Profile',
    style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0
    ),
  );

  ProfileHeader({Key key, @required this.user});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          MyUserInfo(user),
          ButtonsBar()
        ],
      ),
    );
  }
}