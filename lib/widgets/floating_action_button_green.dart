import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  bool isFav = false;
  void onPressedFav() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(isFav ? 'Fav removed' : 'Fav addded'),
    ));
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Color(0xff11da53),
      mini: true,
      tooltip: 'Fav',
      onPressed: onPressedFav,
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border
      ),
    );
  }

}