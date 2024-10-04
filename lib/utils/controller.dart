import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/services/firebaseStorage.dart';
import 'package:hastlehub/services/firestoreDataBase.dart';
import 'package:image_picker/image_picker.dart';



File ? imageFile;
FireStorage storeImage = FireStorage();
  FirestoreServices saveImage = FirestoreServices();

  final ImagePicker _picker = ImagePicker();

// Function to pick an image from the gallery
  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
    
        imageFile =
            File(pickedFile.path); // Convert the picked file to a File object
   

      try {
        String? imageUrl = await storeImage.storeImage(pickedFile);
        if (imageUrl != null) {
          // Save the image URL to Firestore
          await saveImage.saveImageUrlToFirestore(imageUrl);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image Uploaded Successfully')),
          );
        }
      } on FirebaseException catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!)),
        );
      }
    }
  }
