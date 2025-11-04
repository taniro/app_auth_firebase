import 'dart:io';

import 'package:app_auth_firebase/services/firebase/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/firebase/firestore_database_service.dart';

class DisplayPicturePage extends StatelessWidget {
  final String imagePath;

  const DisplayPicturePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {

    FirestoreDatabaseService remoteDbService= Provider.of<FirestoreDatabaseService>(context, listen: false);
    StorageService firebaseStorageService= Provider.of<StorageService>(context, listen: false);


    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String firebasePath = firebaseStorageService.generatePath();
          firebaseStorageService.uploadFile(File(imagePath), firebasePath);
          remoteDbService.sendPictureMessage(firebasePath);
          Navigator.popUntil(context, (route) {
            // Verifica se o nome da rota é igual a "/"
            return route.isFirst; // Mantém apenas a primeira rota na pilha
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}