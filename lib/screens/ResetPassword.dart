



import 'package:firebase/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> UserKey = GlobalKey<FormState>();
  bool _secure1 = true;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController2 = TextEditingController();


  void Validate(){
    if(UserKey.currentState!.validate()){
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController2.text).then((value) {
        Fluttertoast.showToast(
            msg: "Account Created Successfully");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home()));
      }).onError((error, stackTrace) {
        print("error ${error.toString()}");
      });
    }else{
      Fluttertoast.showToast(msg: "Field Required");
    }
  }

  // void Validate(){
  //   if(UserKey.currentState!.validate()){
  //     FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailTextController.text,
  //         password: passwordTextController2.text).then((value) {
  //       Fluttertoast.showToast(
  //           msg: "Account Created Successfully");
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => Home()));
  //     }).onError((error, stackTrace) {
  //       print("error ${error.toString()}");
  //     });
  //   }else{
  //     Fluttertoast.showToast(msg: "Field Required");
  //   }
  // }

  Future ResetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text.trim()).then((value) => Navigator.pop(context ,true),);
          //Fluttertoast.showToast(msg: "Email is sent to");
      var snackBar = SnackBar(content: Text('Password reset link sent to Your Email'),backgroundColor: Color(0XFF292E49),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
      on FirebaseAuthException catch (e) {
      var snackBar = SnackBar(content: Text(e.message.toString()),backgroundColor: Color(0XFF292E49),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFF292E49),
                Color(0xFF536976),
                Color(0xFFBBD2C5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 100, right: 7, left: 7),
            child: Form(
              key: UserKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/Image/aaa.png",
                    fit: BoxFit.fill,
                    height: 300,
                    width: 500,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailTextController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        focusColor: Colors.black,
                        prefixIcon:
                            Icon(Icons.email_sharp, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Field is Required"),
                        EmailValidator(errorText: "Correct Email is Required"),
                      ]),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    height: 68,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate();
                        ResetPassword();

                      },
                      child: Text("Submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
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
