import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_list.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.done:
            return showPlaceData(snapshot);
          case ConnectionState.active:
            return showPlaceData(snapshot);
          default:
            return CircularProgressIndicator();
        }
      }
    );
  }

}

Widget showPlaceData(AsyncSnapshot<FirebaseUser> snapshot) {
  if(!snapshot.hasData || snapshot.hasError){
    return Text('error....');
  }

  User user = User(
      uid: snapshot.data.uid,
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoUrl
  );

  return Stack(
    children: <Widget>[
      GradientBack(height: 250,),
      CardImageList(user: user,)
    ],
  );
}