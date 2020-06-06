import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Container(
      height: 320,
      child: StreamBuilder(
        stream: userBloc.placesStream,
          builder: (context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.done:
                return showListView(snapshot);
              case ConnectionState.active:
                return showListView(snapshot);
              default:
                return CircularProgressIndicator();
            }
          }
      ),
    );
  }

  Widget showListView (AsyncSnapshot snapshot) {
    return ListView(
      padding: EdgeInsets.all(25),
      scrollDirection: Axis.horizontal,
      children: userBloc.buildPlaces(snapshot.data.documents),
    );
  }

}