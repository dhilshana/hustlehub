import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  Future<void> updateCompanyData(CompanyModel company,String jobId, Map<String, dynamic> jobData) async{
    try{
      String? id = AuthServices().getUser();
      if(id!= null){

         // Step 1: Update company-level data
        await FirebaseFirestore.instance.collection('Companies').doc(id).update(company.toMap());

         // Step 2: Update job-level data in a subcollection
      await FirebaseFirestore.instance
          .collection('Companies')
          .doc(id)
          .collection('Jobs') // Subcollection for jobs
          .doc(jobId) // Each job document has a unique jobId
          .set(company.jobDataToMap(jobData)); // Add job data
      }
    }
    catch(e){
      rethrow;
    }
  }

 

 Future<CompanyModel?> getJobData() async {
  try {
    String? id = AuthServices().getUser();
    if (id != null) {
      // Fetch the company document
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Companies').doc(id).get();

      if (doc.exists) {
        // Parse the company data
        CompanyModel company = CompanyModel.fromMap(doc.data() as Map<String, dynamic>);

        // Fetch the jobs subcollection
        QuerySnapshot jobSnapshot = await FirebaseFirestore.instance
            .collection('Companies')
            .doc(id)
            .collection('Jobs')
            .get();

        // Parse the job documents and map to job objects
        company.jobs = jobSnapshot.docs.map((doc) {
          Map<String, dynamic> jobData = doc.data() as Map<String, dynamic>;

          // Include the job ID (title) as part of the job data
          jobData['jobTitle'] = doc.id;
          return jobData;
        }).toList();

        return company; // Return the complete CompanyModel with jobs
      } else {
        print("Company document not found.");
      }
    }
  } catch (e) {
    print('--------------$e-------------------');
  }
  return null;
}

Future<void> deleteJobData(String title,BuildContext context) async{
  try{
     String? id = AuthServices().getUser();
    if (id != null) {
    final collection = FirebaseFirestore.instance.collection('Companies').doc(id).collection('Jobs').doc(title).delete();
    print('deleted successfully');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted successfully')));
    }
  }catch(e){
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
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

Future<List<Map<String, dynamic>>> fetchAllJobs() async {
  List<Map<String, dynamic>> allJobs = [];

  try {
    // Fetch all company documents from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('Companies')
        .get();

    // Iterate through each company document
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> companyData = doc.data();
       String companyName = companyData['company'];
      String companyEmail = companyData['email'];

      // Fetch the 'jobs' subcollection for the current company
      CollectionReference jobsRef = doc.reference.collection('Jobs');
      QuerySnapshot jobsSnapshot = await jobsRef.get(); 

      // Iterate through each job document in the subcollection
      for (var jobDoc in jobsSnapshot.docs) {
        // Get the job details and job title (which is the document ID)
        Map<String, dynamic> jobDetails = jobDoc.data() as Map<String,dynamic>;
        String jobTitle = jobDoc.id; // The document ID is the job title
      
       // Create a map that includes company details, job title, and job details
        allJobs.add({
          'companyName': companyName,
          'companyEmail': companyEmail,
          'jobTitle': jobTitle,
          'jobDetails': jobDetails,
        });
      }
    }
  } catch (e) {
    rethrow;
  }

  return allJobs;
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