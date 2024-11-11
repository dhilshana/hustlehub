import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/services/firestoreDataBase.dart';
import 'package:hastlehub/users/screens/notificationScreen.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/utils/controller.dart';
import 'package:hastlehub/users/widgets/recommendationWidget.dart';
import 'package:intl/intl.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({
    super.key,
  });

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  FirestoreServices firestoreServices = FirestoreServices();

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
          leading: const Icon(
            Icons.list,
            size: 30,
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
              backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
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
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 18,
                    color: ktextColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(DateTime.parse(DateTime.now().toString())),
                    style: const TextStyle(
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
              const Row(
                children: [
                  Text(
                    "Recommendations",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "Show All",
                    style: TextStyle(color: kshowAllColor),
                  )
                ],
              ),
              ksizedBoxHeight,
              FutureBuilder(
                future: fetchAndDisplayAllJobs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No data yet'),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                        context, AppRoute.jobDetailScreen,
                                        arguments: snapshot.data![index])
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                              child: RecommendationWidget(
                                jobDetails: snapshot.data![index],
                              ));
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
