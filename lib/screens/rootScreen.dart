import 'package:flutter/material.dart';
import 'package:hastlehub/screens/appliedJobScreen.dart';
import 'package:hastlehub/screens/exploreScreen.dart';
import 'package:hastlehub/screens/home.dart';
import 'package:hastlehub/screens/profileScreen.dart';
import 'package:hastlehub/widgets/customBotNavWidget.dart';

class RootScreen extends StatefulWidget {
  int? index;
  RootScreen({super.key,this.index=0});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {


  
List<Widget> pages = [
    Home(),
    AppliedJobScreen(),
    ExploreScreen(),
    ProfileScreen()
  ];

  int selectedIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar:  Stack(
            clipBehavior: Clip
                .none, // Ensures the CircleAvatar can overflow outside the Stack
            children: [
              CustomBottomNavWidget(
                selectedIndex: selectedIndex,
                onTap: (value) {

                
             setState(() {
               selectedIndex = value;
             });
         
             print("------------------");
             print(selectedIndex);
           }
                  
                
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width / 2) -
                    30, // Center horizontally,
                bottom: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent[700],
                  foregroundColor: const Color.fromARGB(255, 32, 30, 30),
                  radius: 30,
                  child: const Icon(
                    Icons.location_on,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
          body: pages[selectedIndex],
    );
  }
}