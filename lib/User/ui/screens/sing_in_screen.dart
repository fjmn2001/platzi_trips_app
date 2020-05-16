import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/platzi_trips_cupertino.dart';
import 'package:platzitripsapp/widgets/button_green.dart';
import 'package:platzitripsapp/widgets/gradient_back.dart';

class SingInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingInScreen();
  }

}

class _SingInScreen extends State<SingInScreen> {

  UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData || snapshot.hasError){
          return singInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget singInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack('', null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome \n this is your travel app',
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: 'Login with Gmail',
                onPressed: () async {
                  await _userBloc.singOut();
                  await _userBloc.singIn();
                },
                width: 300,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}