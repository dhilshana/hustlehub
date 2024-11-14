import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hastlehub/firebase_options.dart';
import 'package:hastlehub/routes/routes.dart';
import 'package:hastlehub/services/authCheck.dart';
import 'package:hastlehub/services/local_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
LocalDatabse ldb = LocalDatabse();
await ldb.initializeDb();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size( 393,852 ),

      //for font .sp
      //container width and height  .w and .h
       minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: (settings) => generateRoute(settings),
        initialRoute: '/',
        // home:  const AuthCheck(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      
          fontFamily: 'SFProDisplay',
         
        ),
      ),
    );
  }
}
