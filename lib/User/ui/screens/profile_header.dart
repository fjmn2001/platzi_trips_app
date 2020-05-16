import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/ui/widgets/button_bar.dart';
import 'package:platzitripsapp/User/ui/widgets/my_user_info.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc _userBloc;
  User user;

  @override
  Widget build(BuildContext context) {

    _userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );

  }

  final title = Text(
    'Profile',
    style: TextStyle(
      fontFamily: 'Lato',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30.0
    ),
  );

  Widget showProfileData(AsyncSnapshot<FirebaseUser> snapshot) {
    if(!snapshot.hasData || snapshot.hasError){
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text('without information.')
          ],
        ),
      );
    } else {
      user = User(
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );
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

}