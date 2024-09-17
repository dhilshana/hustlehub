import 'package:flutter/material.dart';
import 'package:hastlehub/screens/home.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/jobVerificationWidget.dart';

class JobVerificationScreen extends StatefulWidget {
  const JobVerificationScreen({super.key});

  @override
  State<JobVerificationScreen> createState() => _JobVerificationScreenState();
}

class _JobVerificationScreenState extends State<JobVerificationScreen> {
  // Dummy data for selection
  final List<bool> _selectedCategories = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "What kind of jobs are you looking for?",
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.code,size: 50,),
                    ),
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.campaign,size: 50,),
                    ),
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.medical_services,size: 50,),
                    ),
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.design_services,size: 50,),
                    ),
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.flight_outlined,size: 50,),
                    ),
                    JobVerificationWidget(
                      title: "Programming",
                      icon: Icon(Icons.engineering,size: 50,),
                    ),
                  ]),
                  kheightinRec,
                  kheightinRec,
              SizedBox(
                width: 200,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()));
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 13)),
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Set border radius
                        ),
                      ),
                    ),
                    child: Text(
                      "Find Jobs",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods to get titles and icons
  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Programming";
      case 1:
        return "Marketing";
      case 2:
        return "Healthcare";
      case 3:
        return "Design";
      case 4:
        return "Aviation";
      case 5:
        return "Construction";
      default:
        return "";
    }
  }

  Icon _getIcon(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.code, size: 40, color: Colors.black);
      case 1:
        return Icon(Icons.campaign, size: 40, color: Colors.black);
      case 2:
        return Icon(Icons.health_and_safety, size: 40, color: Colors.black);
      case 3:
        return Icon(Icons.design_services, size: 40, color: Colors.black);
      case 4:
        return Icon(Icons.flight_takeoff, size: 40, color: Colors.black);
      case 5:
        return Icon(Icons.construction, size: 40, color: Colors.black);
      default:
        return Icon(Icons.question_mark);
    }
  }
}
