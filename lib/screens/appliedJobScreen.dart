import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/appliedJobWidget.dart';
import 'package:hastlehub/widgets/customBotNavWidget.dart';
import 'package:hastlehub/widgets/searchWidget.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({super.key});

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Stack(
          clipBehavior: Clip
              .none, // Ensures the CircleAvatar can overflow outside the Stack
          children: [
            CustomBottomNavWidget(),
            Positioned(
              left: (MediaQuery.of(context).size.width / 2) -
                  30, // Center horizontally,
              bottom: 30,
              child: CircleAvatar(
                child: Icon(
                  Icons.location_on,
                  size: 35,
                ),
                backgroundColor: Colors.greenAccent[700],
                foregroundColor: Color.fromARGB(255, 32, 30, 30),
                radius: 30,
              ),
            )
          ],
        ),
        backgroundColor: kBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,30,20,0),
          child: Column(
            children: [
              SearchWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return AppliedJobWidget(selType: "approved",);
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
