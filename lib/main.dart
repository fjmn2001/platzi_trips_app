import 'package:flutter/material.dart';
import 'package:platzitripsapp/User/ui/screens/sing_in_screen.dart';
import 'package:platzitripsapp/platzi_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/bloc/bloc_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: PlaztiTrips(),
      home: SingInScreen(),
    ), bloc: UserBloc());
  }
}