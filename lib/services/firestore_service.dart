import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreService {
  FireStoreService._();

  static FireStoreService storeService = FireStoreService._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addNewUser({
    required String email,
    required String name,
    required File image,
  }) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    var reference = storage.ref().child("Users");

    // var uploadTask = reference.child("$name.jpg").putFile(image);
    //
    // var taskSnapshot = await uploadTask.whenComplete(() {});
    await reference.putFile(image);

    log("===========================");
    log("Store Data in FireStore.......");
    log("===========================");

    firestore.collection('users').doc(email).set({
      'email': email,
      'name': name,
      'image': await reference.getDownloadURL(),
    });
  }
}
