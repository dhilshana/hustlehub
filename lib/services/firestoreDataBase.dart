import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hastlehub/company/models/companyModel.dart';
import 'package:hastlehub/users/models/usermodel.dart';
import 'package:hastlehub/services/auth_services.dart';

class FirestoreServices{
  
  Future<void> storeData(UserModel data) async{
    try{

      String? id = AuthServices().getUser();
      if(id != null){
     await FirebaseFirestore.instance.collection('Users').doc(id).set(data.toMap());
      }
    }
    catch(e){
      rethrow;
    }
  }

  Future<void> storeCompanyData(CompanyModel company) async {
    try{
      String? id = AuthServices().getUser();
      if(id!=null){
        await FirebaseFirestore.instance.collection('Companies').doc(id).set(company.toMap());
      }
    }
    catch (e){
      rethrow;
    }
  }

  Future<void> saveImageUrlToFirestore(String imageUrl) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String? id = AuthServices().getUser();

    // Create a new document with the image URL
    await firestore.collection('Users').doc(id).update({
      'imageUrl': imageUrl,
      'uploadedAt': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    rethrow;
  }
}

Future<void> updateData(String data,String key)async{
  try{
     String? id = AuthServices().getUser();
      if(id != null){
     await FirebaseFirestore.instance.collection('Users').doc(id).update({key:data});
      }
    }
    catch(e){
      rethrow;
  }
}

// Future<UserModel?> readData() async{
//   try{
//    String? id = AuthServices().getUser();
//    if(id!= null){
//      // Fetch the document from Firestore
//       DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('Users').doc(id).get();
//        if (snapshot.exists) {
//         // Convert the document data into a UserModel
//         UserModel data = UserModel.fromMap(snapshot.data()!);
//         return data;
//       } else {
//         return null; // Handle the case where no data exists for the user
//       }
//    }
//   }catch(e){
//     rethrow;
//   }
// }

}