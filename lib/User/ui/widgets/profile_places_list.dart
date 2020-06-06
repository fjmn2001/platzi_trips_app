import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/User/model/user.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc _userBloc;
  final User user;

  ProfilePlacesList({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: StreamBuilder(
          stream: _userBloc.myPlacesStream(user.uid),
          builder: (context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                  children: _userBloc.buildPlaces(snapshot.data.documents),
                );
              case ConnectionState.active:
                return Column(
                  children: _userBloc.buildPlaces(snapshot.data.documents),
                );
              default:
                return CircularProgressIndicator();
            }
          }
      ),
    );
  }

}