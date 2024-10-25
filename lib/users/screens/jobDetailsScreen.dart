import 'package:flutter/material.dart';
import 'package:hastlehub/services/firestoreDataBase.dart';
import 'package:hastlehub/users/widgets/recommandationJobsWidget.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:intl/intl.dart';

class UserJobDetailScreen extends StatelessWidget {
  final jobDetails;
  UserJobDetailScreen({super.key,required this.jobDetails});
  FirestoreServices firestoreServices = FirestoreServices();

  Future<void> applyjob(String companyId,String jobId,Map<String,dynamic> applicantDetails,BuildContext context)async{
    try{
      firestoreServices.applyJob(companyId: companyId, jobId: jobId, applicantDetails: applicantDetails);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String companyId = jobDetails['docId'];
    final String jobTitle = jobDetails['jobTitle'] ;
     String initialSalary = jobDetails['jobDetails']['initialSalary'] ; 
     String finalSalary = jobDetails['jobDetails']['finalSalary'] ; 
     String currency = jobDetails['jobDetails']['currency'];
     String jobLocation = jobDetails['jobDetails']['jobLocation'] ;
     int applicationCount = jobDetails['jobDetails']['applicationCount'] ?? 0;
     String date = jobDetails['jobDetails']['date'];
      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
     String jobType = jobDetails['jobDetails']['oppurtunityType'];
     String jobTime = jobDetails['jobDetails']['jobTime'];
     List perks = jobDetails['jobDetails']['perks'];
     List prefernce = jobDetails['jobDetails']['preference'];
     List description =  jobDetails['jobDetails']['desc'];
     int experience = jobDetails['jobDetails']['experience'];
     int openings = jobDetails['jobDetails']['openingsCount'];
     String skill = jobDetails['jobDetails']['skills'];

    

    return SafeArea(child: Scaffold(
      appBar: AppBar(
         backgroundColor: kBgColor,
      ),
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RecommandationJobsWidget(value: jobTitle, title: 'Title'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: description, title: 'Description'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: jobLocation, title: 'Location'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: jobType, title: 'Oppurtunity Type'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: jobTime, title: 'Working Time'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: '$initialSalary $currency - $finalSalary $currency', title: 'Salary'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: '$experience years', title: 'Experience Required'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: skill, title: 'Skills Required'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: perks, title: 'Perks'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: prefernce, title: 'Candidate Preference'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: formattedDate, title: 'Posted Date'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: openings.toString(), title: 'No: of Openings'),
              Divider(
                height: 20,
              ),
               RecommandationJobsWidget(value: applicationCount.toString(), title: 'No of Applications'),
              Divider(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  
                      onPressed: () {
                        applyjob(companyId, jobTitle, {'name':'p1','age':20,'email':'p1@gmail.com'}, context);
                        },
                      
                      style: ButtonStyle(
                        
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 13)),
                        backgroundColor: const WidgetStatePropertyAll(Colors.black),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Set border radius
                          ),
                        ),
                      ),
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    ));
  }
}