
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase/screens/home_screen.dart';
import 'package:firebase/screens/signin_screen.dart';
import 'package:firebase/screens/signup_screen.dart';

import 'package:firebase/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



// void main() async {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.grey));
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
// import 'package:page_transition/page_transition.dart';
// import 'firebase_options.dart';

void main() async {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.grey));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),

     // home:Screen(),

      home:SignInScreen()

    );
  }
}
