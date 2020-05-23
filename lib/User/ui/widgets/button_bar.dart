import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/ui/screens/add_place_screen.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc _userBloc;
  void onPressedVpnKey () => {};
  void onPressedExitToApp () => _userBloc.singOut();

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);

    void onPressedAdd () => {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        File image;
        return AddPlaceScreen(image: image,);
      }))
    };

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 10.0
      ),
      child: Row(
        children: <Widget>[
          CircleButton(
            mini: true,
            icon: Icons.vpn_key,
            iconSize: 20,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            onPressed: onPressedVpnKey
          ),
          CircleButton(
            mini: true,
            icon: Icons.add,
            iconSize: 40,
            color: Color.fromRGBO(255, 255, 255, 1),
            onPressed: onPressedAdd
          ),
          CircleButton(
            mini: true,
            icon: Icons.exit_to_app,
            iconSize: 20,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            onPressed: onPressedExitToApp
          ),
        ],
      )
    );
  }

}