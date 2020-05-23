import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.iconData,
    @required this.onPressed
  });

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
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
//      child: Icon(
//        isFav ? Icons.favorite : Icons.favorite_border
//      ),
    );
  }

}