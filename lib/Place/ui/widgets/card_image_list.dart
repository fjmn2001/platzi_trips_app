import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/User/bloc/bloc_user.dart';
import 'package:platzitripsapp/User/model/user.dart';

class CardImageList extends StatefulWidget {

  User user;

  CardImageList({Key key, @required this.user});

  @override
  State<StatefulWidget> createState() {
    return _cardImageList();
  }
}

class _cardImageList extends State {
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
      children: places.map((place){
        return CardImageWithFabIcon(
          pathImage: place.urlImage,
          internet: true,
          width: 300.0,
          height: 250.0,
          left: 20.0,
          iconData: place.liked?iconDataLiked:iconDataLike,
          onPressedFabIcon: (){
            setLiked(place);
          },
          //internet: true,
        );
      }).toList(),
    );
  }

  void setLiked(Place place){
    setState(() {
      place.liked = !place.liked;
      userBloc.likePlace(place, widget.user.uid);
    });
  }

  Widget listViewPlaces(List<Place> places){

    void setLiked(Place place){
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place){
        return CardImageWithFabIcon(
          pathImage: place.urlImage,
          internet: true,
          width: 300.0,
          height: 250.0,
          left: 20.0,
          iconData: place.liked?iconDataLiked:iconDataLike,
          onPressedFabIcon: (){
            setLiked(place);
          },
          //internet: true,
        );
      }).toList(),
    );
  }

}