import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc _userBloc;
  void onPressedVpnKey () => {};
  void onPressedAdd () => {};
  void onPressedExitToApp () => _userBloc.singOut();

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 10.0
      ),
      child: Row(
        children: <Widget>[
          CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), onPressedVpnKey),
          CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), onPressedAdd),
          CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6), onPressedExitToApp),
        ],
      )
    );
  }

}