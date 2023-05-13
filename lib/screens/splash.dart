import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase/screens/signin_screen.dart';
import 'package:firebase/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'ResetPassword.dart';
import 'home_screen.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3),()=>Navigator.push(context, PageTransition(child: SignInScreen(), type:PageTransitionType.leftToRight)));
  // }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
           backgroundColor: Colors.white,
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/Image/splash.png",fit:BoxFit.scaleDown,width: 500,),
              Text("Please  Wait",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,)),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: CircularProgressIndicator(
                  backgroundColor:Colors.white10,
                ),
              ),
            ],
          ),
          splashTransition:SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          splashIconSize: 500,
          nextScreen: SignInScreen(),
    );
  }
}
