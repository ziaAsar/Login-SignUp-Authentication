import 'package:firebase/screens/ResetPassword.dart';
import 'package:firebase/screens/home_screen.dart';
import 'package:firebase/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_sign_in/google_sign_in.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _secureText = true;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  TextEditingController emailTextController= TextEditingController();
  TextEditingController passwordTextController= TextEditingController();

  _handleGoogleBtnClick(){
  _signInWithGoogle().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home())));
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async{
    await FirebaseAuth.instance.signOut();

    await GoogleSignIn().signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.only(top: 35,right: 7,left: 7),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                 // Text("Hello sir",style: TextStyle(fontSize: 68),),
                 Image.asset("assets/Image/My.png",
                   fit: BoxFit.fill,
                   height: 370,
                   width: 500,
                 ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      controller: emailTextController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        focusColor: Colors.black,
                        prefixIcon: Icon(Icons.person,color: Colors.black),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                         borderSide:BorderSide(color: Colors.black,width: 2),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.black,width: 2))
                      ),
                      onTap: (){

                      },
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Field Required"),
                          EmailValidator(errorText: "Correct Email is Required"),
                        ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      controller: passwordTextController,
                      cursorColor: Colors.black,
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.black,width: 2)),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _secureText =!_secureText;
                          });
                        },
                            icon: Icon(_secureText ? Icons.remove_red_eye_sharp: Icons.remove_red_eye_outlined),
                          color: Colors.black,
                        ),
                      ),
                      obscureText: _secureText,
                      onTap: (){
                      },
                      // style: TextStyle(color: Colors.black),
                      validator:MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character'),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 220),
                    child: TextButton(
                      onPressed: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        //Navigator.push(context, PageTransition(child: ForgotPassword(), type: PageTransitionType.leftToRightJoined,childCurrent: widget));
                        Navigator.push(context, PageTransition(child: ForgotPassword(), type: PageTransitionType.leftToRight));

                    },
                        child: Text("Forgot Password ?",style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()) {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text).then((
                            value) {
                          Fluttertoast.showToast(
                              msg: "Login Successfully Welcome to the DashBoard");
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Home()));
                          Navigator.push(context, PageTransition(child: Home(), type: PageTransitionType.leftToRight));
                        }).onError((error, stackTrace) {
                         // print("error ${error.toString()}");
                          // var snackBar = SnackBar(content: Text(error.toString()),backgroundColor: Color(0XFF292E49),);
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Fluttertoast.showToast(msg: "Password is incorrect please check the password");
                        });
                      }else{
                        Fluttertoast.showToast(msg: "Field Can't be Empty");
                      }
                    },
                        child: Text("Login",style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                         // side: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        TextButton(onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          Navigator.push(context, PageTransition(child: SignUpScreen(), type: PageTransitionType.leftToRight));
                        },
                            child: Text("Sign Up2",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.deepOrange,
                    child: Container(
                      padding: EdgeInsets.only(left: 5,right: 5),
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 15,
                            backgroundColor: Colors.white70,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            _handleGoogleBtnClick();
                          },
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0,right:1,top: 6,bottom: 7),
                                child: Image.asset("assets/Image/google.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Sign in With Google",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                              ),
                            ],
                          )
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
