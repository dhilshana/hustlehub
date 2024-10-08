import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/users/screens/notificationScreen.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/utils/controller.dart';
import 'package:hastlehub/users/widgets/recommendationWidget.dart';

class UserHomeScreen extends StatefulWidget {
 
const UserHomeScreen({super.key,});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            backgroundColor: kBgColor,
            surfaceTintColor: Colors.transparent,
            title: const Text(
              "Hustlehub",
              style: TextStyle(
                  fontFamily: ktitleText,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () async{
              
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen(),), (route) => false,);
                
              },
              icon:Icon(Icons.list,
              
              size: 30,
              )
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.notificationScreen);
                },
                child: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage:imageFile != null ? FileImage(imageFile!) : null,
                backgroundColor: kcontainerColor, 
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 15, 20, 15),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: ktextColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Mon 30, Nov 25",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: ktextColor),
                    )
                  ],
                ),
                const Text(
                  "Find Your Perfect Job",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                ),
                ksizedBoxHeight,
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kcontainerColor,
                  ),
                ),
                ksizedBoxHeight,
                const Row(
                  children: [
                    Text(
                      "Recommendations",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "Show All",
                      style: TextStyle(color: kshowAllColor),
                    )
                  ],
                ),
                ksizedBoxHeight,
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const RecommendationWidget();
                    },
                  ),
                )
              ],
            ),
          ),
          ),
    );
  }
}
