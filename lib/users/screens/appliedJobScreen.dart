import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/users/widgets/appliedJobWidget.dart';
import 'package:hastlehub/users/widgets/customBotNavWidget.dart';
import 'package:hastlehub/users/widgets/searchWidget.dart';

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
