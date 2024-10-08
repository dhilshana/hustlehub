import 'package:flutter/material.dart';
import 'package:hastlehub/company/screens/addJobScreen.dart';
import 'package:hastlehub/company/screens/home.dart';
import 'package:hastlehub/routes/routeConstants.dart';
import 'package:hastlehub/services/authCheck.dart';
import 'package:hastlehub/users/screens/appliedJobScreen.dart';
import 'package:hastlehub/users/screens/exploreScreen.dart';
import 'package:hastlehub/users/screens/home.dart';
import 'package:hastlehub/users/screens/jobVerificationScreen.dart';
import 'package:hastlehub/users/screens/loginScreen.dart';
import 'package:hastlehub/users/screens/notificationScreen.dart';
import 'package:hastlehub/users/screens/personalInfoScreen.dart';
import 'package:hastlehub/users/screens/profileScreen.dart';
import 'package:hastlehub/users/screens/roleScreen.dart';
import 'package:hastlehub/users/screens/rootScreen.dart';
import 'package:hastlehub/users/screens/securityCheck.dart';
import 'package:hastlehub/users/screens/settingScreen.dart';
import 'package:hastlehub/users/screens/splashScreen.dart';
import 'package:hastlehub/users/screens/verificationScreen.dart';
import 'package:hastlehub/users/screens/welcomeScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case '/':return MaterialPageRoute(builder: (context) =>AuthCheck(),);
    case AppRoute.splashScreen:
    return MaterialPageRoute(builder: (context)=>SplashScreen());
    case AppRoute.welcomeScreen:
    return MaterialPageRoute(builder: (context) => WelcomeScreen(),);
    case AppRoute.loginScreen:{
     String name = routeSettings.arguments as String;
    return MaterialPageRoute(builder: (context) => LoginScreen(title: name,),);
    }
    case AppRoute.roleScreen:{
      Map<String,dynamic> userData = routeSettings.arguments as Map<String,dynamic>;
      print(userData);
    return MaterialPageRoute(builder: (context) => RoleScreen(user: userData,),);
    }
    case AppRoute.securityCheckScreen:{
      Map<String,dynamic> userData = routeSettings.arguments as Map<String,dynamic>;
      print(userData);
    return MaterialPageRoute(builder: (context)=> SecurityCheckScreen(user: userData,));
    }
    case AppRoute.verificationScreen:{
      Map<String,dynamic> userData = routeSettings.arguments as Map<String,dynamic>;
      print(userData);
    return MaterialPageRoute(builder: (context) => VerificationScreen(user: userData),);
    }
    case AppRoute.jobVerificaionScreen:{
      Map<String,dynamic> userData = routeSettings.arguments as Map<String,dynamic>;
      print(userData);
    return MaterialPageRoute(builder: (context) => JobVerificationScreen(user: userData,),);
    }
    case AppRoute.rootScreen:
    return MaterialPageRoute(builder: (context) => RootScreen(),);
    case AppRoute.userHomeScreen:
    return MaterialPageRoute(builder: (context) => UserHomeScreen(),);
    case AppRoute.exploreScreen:
    return MaterialPageRoute(builder: (context) => ExploreScreen(),);
    case AppRoute.appliedJobScreen:
    return MaterialPageRoute(builder: (context) => AppliedJobScreen(),);
    case AppRoute.profileScreen:
    return MaterialPageRoute(builder: (context) => ProfileScreen(),);
    case AppRoute.settingScreen:
    return MaterialPageRoute(builder: (context) => SettingScreen(),);
    case AppRoute.personalInfoScreen:
    return MaterialPageRoute(builder: (context) => PersonalInfoScreen(),);
    case AppRoute.notificationScreen:
    return MaterialPageRoute(builder: (context) => NotificationScreen(),);
    case AppRoute.companyHomeScreen:
    return MaterialPageRoute(builder: (context) => CompanyHomeScreen(),);
    case AppRoute.addJobScreen:
    return MaterialPageRoute(builder: (context) => AddJobScreen());
    default :
   return MaterialPageRoute(builder: (context)=> Scaffold());
  }
}