import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/Place/repository/firebase_storage_repository.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/repository/auth_repository.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_api.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_repository.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_place.dart';

class UserBloc extends Bloc {

  final AuthRepository _authRepository = AuthRepository();
  final CloudFirestoneRepository _cloudFirestoneRepository = CloudFirestoneRepository();
  final FirebaseStorageRepository _firebaseStorageRepository = FirebaseStorageRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //1.- SingIn with Google
  Future<FirebaseUser> singIn() => _authRepository.singInFirebase();

  //2.- register a user on database
  void updateUserData(User user) => _cloudFirestoneRepository.updateUserDataFirestone(user);

  Stream<QuerySnapshot> get placesStream => Firestore.instance.collection(CloudFirestoneApi().PLACES).snapshots();
  Stream<QuerySnapshot> myPlacesStream(String uid) => Firestore.instance
      .collection(CloudFirestoneApi().PLACES)
      .where('userOwner', isEqualTo: Firestore.instance.document("${CloudFirestoneApi().USERS}/${uid}"))
      .snapshots();

  List<ProfilePlace> buildMyPlaces (List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoneRepository.buildMyPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoneRepository.buildPlaces(placesListSnapshot, user);
  Future<void> likePlace(Place place,String uid) => _cloudFirestoneRepository.likePlace(place, uid);

  //3.- register a place on database
  Future<void> updatePlaceData(Place place) => _cloudFirestoneRepository.updatePlaceData(place);
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  //4.-
  StreamController placeSelectedStreamController =  StreamController();
  Stream get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink get placeSelectedSink =>  placeSelectedStreamController.sink;

  void singOut() async => _authRepository.singOut();

  @override
  void dispose() {

  }

}