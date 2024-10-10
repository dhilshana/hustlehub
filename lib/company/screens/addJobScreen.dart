import 'package:flutter/material.dart';
import 'package:hastlehub/company/models/companyModel.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/jobDetails.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/oppurtunityTypeWidget.dart';
import 'package:hastlehub/company/widgets/addJobWidgets/salaryWidget.dart';
import 'package:hastlehub/services/firestoreDataBase.dart';

import 'package:hastlehub/utils/constants.dart';
import 'package:intl/intl.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  FirestoreServices firestoreServices = FirestoreServices();

  String? selectedOpportunityType; // State for selected opportunity type
  String? jobTitle;
  String? skillsRequired;
  int? yearsOfExp;
  String? jobType;
  String? location;
  String? jobTime;
  int? openingsCount;
  List<String> jobDesc = [];
  List<String> preference = [];
  String? currency;
  String? initialSalary;
  String? finalSalary;
  List<String> perks=[];

  void updateData() async {
    try {
      await firestoreServices.updateCompanyData(CompanyModel(
       oppurtunityType: selectedOpportunityType,
                        role: jobTitle,
                        experience: yearsOfExp, //...
                        skills: skillsRequired,
                        jobType: jobType,
                        jobTime: jobTime,
                        openingsCount:openingsCount,
                        initialSalary: initialSalary, ///....
                        finalSalary: finalSalary,  //...
                        desc: jobDesc, 
                        currency: currency, //...
                        prefrence: preference,
                        perks: perks,
                        jobLocation: location,
                        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        

      ));
          ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Updteded Successfully')));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    
    }
  }

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
                OppurtunityTypeWidget(
                  opportunityType: (String? value) {
                    setState(() {
                      selectedOpportunityType =
                          value; // Update the state with the selected value
                    });
                  },
                ),
                ksizedBoxHeight,
                JobDetailsWidget(jobTitle: (String? value) {
                  setState(() {
                    jobTitle = value;
                  });
                  
                },
                yearsOfExp: (int? value) {
                
                    setState(() {
                      yearsOfExp = value;
                    });
                  
    
                },
                skillsRequired: (value) {
                  setState(() {
                    skillsRequired = value;
                  });
                },
                jobType: (value) {
                  setState(() {
                    jobType = value;
                  });
                },
                location: (value) {
                  setState(() {
                    location = value;
                  });
                },
                jobTime: (value) {
                  setState(() {
                    jobTime = value;
                  });
                },
                openingsCount: (value) {
                  setState(() {
                    openingsCount = value;
                  });
                },
                jobDesc: (value) {
                  setState(() {
                    jobDesc = value;
                  });
                },
                preferences: (value) {
                  preference = value;
                },
                ),
                ksizedBoxHeight,
                SalaryWidget(
                  currencyType: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      currency = value;

                    });
                    });
                     
                  },
                  initialSalary: (value) {
                    initialSalary = value;
                  },
                  
                  finalSalary: (value) {
                    finalSalary = value;
                  },
                  perks: (value) {
                    perks =value;
                  },
                ),
               
                ksizedBoxHeight,
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          kfontColor,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // Set border radius
                          ),
                        ),
                      ),
                      onPressed: () {
                      updateData();
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
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
