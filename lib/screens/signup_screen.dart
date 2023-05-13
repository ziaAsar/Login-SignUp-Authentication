import 'package:firebase/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState>UserKey = GlobalKey<FormState>();
  // GlobalKey<FormState>EmailKey = GlobalKey<FormState>();
  // GlobalKey<FormState>PasswordKey = GlobalKey<FormState>();
  bool _secure1 = true;
  TextEditingController emailTextController2= TextEditingController();
  TextEditingController passwordTextController2= TextEditingController();
  void Validate(){
    if(UserKey.currentState!.validate()){
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController2.text,
          password: passwordTextController2.text).then((value) {
        Fluttertoast.showToast(
            msg: "Account Created Successfully");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => Home()));
        Navigator.push(context, PageTransition(child: Home(), type: PageTransitionType.leftToRight));
      }).onError((error, stackTrace) {
        print("error ${error.toString()}");
      });
    }else{
      Fluttertoast.showToast(msg: "Field Required");
    }
  }

 // Object? get isEmpty => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Color(0XFF292E49),
              Color(0xFF536976),
              Color(0xFFBBD2C5),
            ],begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 35,right: 4,left: 4,bottom: 1),
            child: Form(
              key: UserKey,
              child: Column(
                children: [
                  Image.asset("assets/Image/signup.png",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        focusColor: Colors.black,
                        prefixIcon: Icon(Icons.person,color: Colors.black),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid,)),
                      ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "User Name required"),

                        ]),
                      onTap: (){

                      }
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      controller: emailTextController2,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        focusColor: Colors.black,
                        prefixIcon: Icon(Icons.email_sharp,color: Colors.black),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid,)),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Field is Required"),
                        EmailValidator(errorText: "Correct Email is Required"),
                      ]),
                      onTap: (){

                      },

                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      controller: passwordTextController2,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        focusColor: Colors.black,
                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _secure1 =!_secure1;
                          });
                        },
                          icon: Icon(_secure1 ? Icons.remove_red_eye_sharp: Icons.remove_red_eye_outlined),
                          color: Colors.black,
                        ),
                        border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),borderRadius:BorderRadius.circular(25)),
                      ),
                      obscureText: _secure1,
                      onTap: (){

                      },
                      // style: TextStyle(color: Colors.black),
                      validator:MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    height: 68,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Validate();
                        // FirebaseAuth.instance.createUserWithEmailAndPassword(
                        //     email: emailTextController2.text,
                        //     password: passwordTextController2.text).then((value) {
                        //   Fluttertoast.showToast(
                        //       msg: "Account Created Successfully");
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) => Home()));
                        // }).onError((error, stackTrace) {
                        //   print("error ${error.toString()}");
                        // });
                    },
                      child: Text("SIGN UP",style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
