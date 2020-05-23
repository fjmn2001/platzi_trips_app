import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/repository/auth_repository.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_repository.dart';

class UserBloc extends Bloc {

  final AuthRepository _authRepository = AuthRepository();
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> singIn() {
    return _authRepository.singInFirebase();
  }

  //2.- register a user on database
  final CloudFirestoneRepository _cloudFirestoneRepository = CloudFirestoneRepository();
  void updateUserData(User user) => _cloudFirestoneRepository.updateUserDataFirestone(user);

  void singOut() async => _authRepository.singOut();

  @override
  void dispose() {

  }

}