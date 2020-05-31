

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  StorageReference _storageReference = FirebaseStorage.instance.ref();

  Future<StorageUploadTask> uploadFile(String path, File image) async {
    StorageUploadTask uploadTask = _storageReference.child(path).putFile(image);

    return uploadTask;
  }
}