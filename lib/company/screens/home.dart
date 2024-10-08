import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/company/widgets/postedJobWidget.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
import 'package:hastlehub/utils/constants.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
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
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return PostedJobWidget();
            },),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addJobScreen);
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