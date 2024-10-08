import 'package:flutter/material.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/jobDetails.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/oppurtunityTypeWidget.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/salaryWidget.dart';

import 'package:hastlehub/utils/constants.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post Internship/Job'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ksizedBoxHeight,
                OppurtunityTypeWidget(),
                ksizedBoxHeight,
                JobDetailsWidget(),
                ksizedBoxHeight,
                SalaryWidget(),
                ksizedBoxHeight,
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kfontColor,),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Set border radius
                                ),
                              ),
                    ),
                    onPressed: (){}, 
                    child: Text('Submit',style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),)),
                ),
                kheightinRec
              ],
            ),
          ),
        ),
      ),
    );
  }
}
