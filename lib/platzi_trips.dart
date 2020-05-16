import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/ui/screens/home_trips.dart';
import 'package:platzitripsapp/User/ui/screens/profile_trips.dart';
import 'package:platzitripsapp/Place/ui/screens/search_trips.dart';

class PlaztiTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlaztiTrips> {

  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearhTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          currentIndex: indexTap,
          onTap: onTapTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('')
            )
          ],
        ),
      ),
//        appBar: AppBar(
//          title: Text('Hi there!!!'),
//        ),
    );
  }

}