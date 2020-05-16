import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzitripsapp/User/repository/auth_repository.dart';

class UserBloc extends Bloc {

  final AuthRepository _authRepository = AuthRepository();

  Future<FirebaseUser> singIn() {
    return _authRepository.singInFirebase();
  }

  @override
  void dispose() {

  }

}