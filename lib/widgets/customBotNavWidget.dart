import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hastlehub/screens/appliedJobScreen.dart';
import 'package:hastlehub/screens/exploreScreen.dart';
import 'package:hastlehub/screens/home.dart';
import 'package:hastlehub/screens/profileScreen.dart';
import 'package:hastlehub/screens/rootScreen.dart';
import 'package:hastlehub/utils/controller.dart';

class CustomBottomNavWidget extends StatefulWidget {
  CustomBottomNavWidget({super.key,this.onTap,this.selectedIndex});

  void Function(int)? onTap;
  int? selectedIndex;

  @override
  State<CustomBottomNavWidget> createState() => _CustomBottomNavWidgetState();
}

class _CustomBottomNavWidgetState extends State<CustomBottomNavWidget> {

  
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
           currentIndex: widget.selectedIndex!,
           onTap: widget.onTap
          
      );
  }
}
