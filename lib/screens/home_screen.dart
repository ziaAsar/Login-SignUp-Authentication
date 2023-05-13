import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  signOut() async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
  }


  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              signOut();
            }, icon: Icon(Icons.logout))
          ],
          backgroundColor: Color(0xff1E425D),
          title: Text("Internet Connection Checker"),
        ),
        body: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
            builder: (context,snapshot){
              return InternetConnectionWidget(
                  widget: ListView.builder(
                    itemCount: 200,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text("Just Close the internet connection and you can see the Dialog box"),
                              SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                      image: AssetImage("assets/Image/hz.jpg"),
                                  ),
                                ),
                                title: Text("Asar zia" + index.toString()),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        );
                      }
                  ),
                  snapshot: snapshot);
            }
        ),
      ),
    );
  }
}
class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult>snapshot;
  final Widget widget;
  const InternetConnectionWidget({Key? key,
    required this.widget,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(snapshot.connectionState){
      case ConnectionState.active:
        final state=snapshot.data;
        switch(state){
          case  ConnectivityResult.none:
            return Center(
                child:DialogBox());
          default:
            return widget;
        }
      default:
        return Text("");
    }
  }
}

Widget DialogBox(){
  return AlertDialog(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    title: Text("No Connection",),
    content: Text("Please Check your internet Connectivity",textAlign: TextAlign.center, ),
    icon:Icon(Icons.wifi_off_rounded,size: 58,),
    actions: [
      TextButton(onPressed: (){
      }, child: Text("Ok",textAlign: TextAlign.center,))
    ],
  );
}

