import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/ui/screens/profile_header.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_background.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return showProfileData(snapshot);
            case ConnectionState.active:
              return showProfileData(snapshot);
            default:
              return CircularProgressIndicator();
          }
        });
  }

  Widget showProfileData(AsyncSnapshot<FirebaseUser> snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[Text("Usuario no logueado, haz login.")],
          ),
        ],
      );
    }

    User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
    );

    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(user: user,), ProfilePlacesList(user: user,)],
        ),
      ],
    );
  }
}
