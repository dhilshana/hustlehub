import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hastlehub/screens/notificationScreen.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/utils/controller.dart';
import 'package:hastlehub/widgets/customBotNavWidget.dart';
import 'package:hastlehub/widgets/recommendationWidget.dart';

class Home extends StatefulWidget {
 
const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
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
