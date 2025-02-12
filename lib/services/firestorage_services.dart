class FireStorageService {
  FireStorageService._();

  static FireStorageService storageService = FireStorageService._();

  // Future addImageForUser({required String name, required File image}) async {
  //   log("===========================");
  //   log("On The Way.......");
  //   log("===========================");
  //   var reference;
  //
  //   reference = storage.ref().child("Users");
  //
  //   var uploadTask = reference.child("$name.jpg").putFile(image);
  //
  //   var taskSnapshot = await uploadTask.whenComplete(() {});
  //
  //   log("Process Success.......");
  //
  //   return await taskSnapshot.ref.getDownloadURL();
  // }
}
