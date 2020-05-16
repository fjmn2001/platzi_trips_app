import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String pathImage = 'assets/img/avatar01.jpg';
  String name = 'Francisco Marcano';
  String details = '1 review 5 photos';
  String comment = 'It is a amazing plase';

  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    final userComment = new Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            fontFamily: 'Lato',
            color: Color(0xFFa3a5a7)),
      ),
    );

    final userInfo = new Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13, fontFamily: 'Lato', color: Color(0xFFa3a5a7)),
      ),
    );

    final userName = new Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 17, fontFamily: 'Lato'),
      ),
    );

    final userDetails = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.pathImage)
        )
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }
}
