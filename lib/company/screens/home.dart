import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/company/models/companyModel.dart';
import 'package:hastlehub/company/widgets/postedJobWidget.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/services/firestoreDataBase.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
import 'package:hastlehub/utils/constants.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {

FirestoreServices firestoreServices = FirestoreServices();
 

  void refreshJobs() {
     if (mounted) { // Check if mounted before calling setState
      setState(() {}); // Trigger a rebuild
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "Hustlehub",
              style: TextStyle(
                  fontFamily: ktitleText,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
            centerTitle: true,
          backgroundColor: kBgColor,
          actions: [
            IconButton(
              onPressed: (){FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen(),), (route) => false,);
              }, 
              icon:const Icon(Icons.logout_outlined))
          ],
        ),
        backgroundColor: kBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 15, 20, 15),
          child:FutureBuilder(
            future: firestoreServices.getJobData(),
             builder: (context, snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
               }
               else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
               }
               else if(!snapshot.hasData || snapshot.data?.jobs == null || snapshot.data!.jobs!.isEmpty){
                return Center(child: Text('No data yet'),);
               }
               else{
                final company = snapshot.data!;
               return ListView.builder(
                itemCount: company.jobs?.length ?? 0,
                itemBuilder: (context, index) {
                  final jobData = company.jobs![index];
                  final companyData = company;
                  //fecth company name and job title
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.postedJobDetailScreen,arguments: jobData);
                    },
                    child: PostedJobWidget(jobData: jobData,companyData: companyData,onJobDeleted: refreshJobs,)); // Pass job data to your widget
                },
               );
               }
             },
             )

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async{
           final result = await Navigator.pushNamed(context, AppRoute.addJobScreen);
          if (result == true) {
            refreshJobs();
          }
        
          },
          shape: CircleBorder(),
          backgroundColor: kfontColor,
          child: Icon(Icons.add,size: 30,),
          foregroundColor: Colors.white,
          
        ),
      ),
    );
  }
}