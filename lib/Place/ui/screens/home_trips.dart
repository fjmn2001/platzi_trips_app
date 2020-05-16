import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_app_bar.dart';

class HomeTrips extends StatelessWidget {

  String dummyText =
    'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace('Duwilli Ella', dummyText, 5),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }

}