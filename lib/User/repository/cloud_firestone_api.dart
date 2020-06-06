import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_place.dart';

class CloudFirestoneApi {
  final String USERS = 'users';
  final String PLACES = 'places';

  final Firestore _db = Firestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);

    await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    await firebaseAuth.currentUser().then((FirebaseUser user) {
      refPlaces.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'urlImage': place.urlImage,
        'userOwner': _db.document('${USERS}/${user.uid}')
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          DocumentReference userRef = _db.collection(USERS).document(user.uid);
          userRef.updateData({
            'myPlaces' : FieldValue.arrayUnion([
              _db.collection(PLACES).document(snapshot.documentID)
            ])
          });
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces (List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();

    placesListSnapshot.forEach((DocumentSnapshot p) {
      profilePlaces.add(ProfilePlace(
        Place(
          name: p.data['name'],
          description: p.data['description'],
          urlImage: p.data['urlImage'],
          likes: p.data['likes']
        )
      ));
    });

    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placeCards = List<CardImageWithFabIcon>();
    double width = 350;
    double height = 250;
    double left = 20;
    IconData iconData = Icons.favorite_border;

    placesListSnapshot.forEach((DocumentSnapshot p) {
      placeCards.add(CardImageWithFabIcon(
        urlImage: p.data['urlImage'],
        iconData: iconData,
        left: left,
        height: height,
        width: width,
        onPressedFabIcon: () {},
      ));
    });

    return placeCards;
  }
}