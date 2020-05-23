import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/repository/auth_repository.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_repository.dart';

class UserBloc extends Bloc {

  final AuthRepository _authRepository = AuthRepository();
  final CloudFirestoneRepository _cloudFirestoneRepository = CloudFirestoneRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //1.- SingIn with Google
  Future<FirebaseUser> singIn() => _authRepository.singInFirebase();

  //2.- register a user on database
  void updateUserData(User user) => _cloudFirestoneRepository.updateUserDataFirestone(user);

  //3.- register a place on database
  Future<void> updatePlaceData(Place place) => _cloudFirestoneRepository.updatePlaceData(place);

  void singOut() async => _authRepository.singOut();

  @override
  void dispose() {

  }

}