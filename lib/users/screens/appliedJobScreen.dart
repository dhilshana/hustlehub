import 'package:flutter/material.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/services/appliedJobsDatabase.dart';
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

  

  AppliedJobsDatabase ajdb = AppliedJobsDatabase();
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
                child: FutureBuilder(
                  future: ajdb.retrieveValue(),
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
                      return ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                Navigator.pushNamed(
                                        context, AppRoute.appliedJobDetailScreen,
                                        arguments: snapshot.data![index])
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                                            child: AppliedJobWidget(selType: "approved",jobData: snapshot.data![index],));
                                        },
                                      );
                    }
                          },
                        ),
              )
            ]
          )
        )
      )
                      );
                    }
}
