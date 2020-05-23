import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzitripsapp/User/model/user.dart';

class CloudFirestoneApi {
  final String USERS = 'users';
  final String PLACES = 'places';

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
}