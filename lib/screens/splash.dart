

import 'package:firebase/screens/signin_screen.dart';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3),()=>Navigator.push(context, PageTransition(
    //     child: SignInScreen(), type:PageTransitionType.leftToRight)
    // ));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF292E49),
      ),
      body: Stack(
        children: [
          Container(
            // 👇 Apply gradient background here
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF292E49), // dark blue
                  Color(0xFF536976), // medium blue-gray
                  Color(0xFFBBD2C5),
                  // Color(0xFFFF8C8C),
                  // Color(0xFFFF8C8C),
                  // Color(0xFFFF8C8C)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: SizedBox(
                height: 500,
                child: CustomPaint(
                  size: size,
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 230,
            left: 15,
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 20,
            child: Text(
              "Ready to learn something new?",
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 80,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 20,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              },
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 22,
                ),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF292E49), // dark blue
                        Color(0xFF536976), // medium blue-gray
                        Color(0xFFBBD2C5), // light green-gray
                        // Color(0xFFFF8C8C),
                        // Color(0xFFFF8C8C),
                        // Color(0xFFFF8C8C)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius:BorderRadius.all(Radius.circular(50))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0017708, size.height * 0.1850000);
    path_0.cubicTo(
      size.width * 0.4976563,
      size.height * 0.0081019,
      size.width * 0.3851562,
      size.height * 0.6332870,
      size.width * 1.0007292,
      size.height * 0.2355556,
    );
    path_0.quadraticBezierTo(
      size.width * 1.0009375,
      size.height * 0.4271296,
      size.width * 1.0015625,
      size.height * 1.0018519,
    );
    path_0.lineTo(0, size.height * 0.9974074);
    path_0.quadraticBezierTo(
      size.width * 0.0004427,
      size.height * 0.7943056,
      size.width * 0.0017708,
      size.height * 0.1850000,
    );
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

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


