import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future uploaddocment(
    {required String grname,
    required String type,
    required  pathb}) async {
  UploadTask? uploadTask;
  final path = '$type/$grname';
  final file = File(pathb);

  final ref = FirebaseStorage.instance.ref().child(path);
  uploadTask = ref.putFile(file);
  final snapshot = await uploadTask.whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();
  print('Download Link:$urlDownload');
}
