import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hastlehub/screens/appliedJobScreen.dart';
import 'package:hastlehub/screens/exploreScreen.dart';
import 'package:hastlehub/screens/home.dart';
import 'package:hastlehub/screens/profileScreen.dart';
import 'package:hastlehub/utils/controller.dart';

class CustomBottomNavWidget extends StatefulWidget {
  CustomBottomNavWidget({super.key});

  @override
  State<CustomBottomNavWidget> createState() => _CustomBottomNavWidgetState();
}

class _CustomBottomNavWidgetState extends State<CustomBottomNavWidget> {

  List<Widget> pages = [
    Home(),
    AppliedJobScreen(),
    ExploreScreen(),
    ProfileScreen()
  ];
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      items: [
            BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          
    
        ),
                    BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Applied Job",
          
        ),
                    BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: "Explore",
        
        ),

                    BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Profile",
          
        ),
          ],
          selectedLabelStyle:  TextStyle(
                fontFamily: 'SFproDisplay',
                
              ),
              
          backgroundColor: const Color.fromARGB(255, 32, 30, 30),
          
          selectedItemColor: Colors.teal,
           unselectedItemColor: Colors.white,
           type: BottomNavigationBarType.fixed,
           currentIndex: selectedIndex,
           onTap: (value) {
             setState(() {
               selectedIndex = value;
             });
             Widget page = pages[selectedIndex];
        
        if (selectedIndex == 0) { // Profile tab
          page = Home(); // Pass image if Profile tab
        }
             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
           },

          
      );
  }
}
