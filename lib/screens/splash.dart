import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.push(context, PageTransition(child: SignInScreen(), type:PageTransitionType.topToBottom)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Image/f.png"),
          Text("Please Wait"),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
