import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzitripsapp/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final FirebaseStorageApi _firebaseStorageApi = FirebaseStorageApi();

  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageApi.uploadFile(path, image);
}