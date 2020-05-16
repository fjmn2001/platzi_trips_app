import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzitripsapp/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final FirebaseAuthApi _firebaseAuthApi = FirebaseAuthApi();

  Future<FirebaseUser> singInFirebase() => _firebaseAuthApi.singIn();
}