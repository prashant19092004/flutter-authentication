import 'package:flutter/material.dart';
import 'package:loginpage/LoginScreen.dart';
import 'package:loginpage/UserHome.dart';
import 'package:loginpage/interoslider/Intro1.dart';
import 'package:loginpage/model/UserSharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: FlowerShopApp()));
}

class FlowerShopApp extends StatefulWidget {
  @override
  State createState() => SplashScreen();
}

class SplashScreen extends State<FlowerShopApp> {
  @override
  void initState() {
    super.initState();
    Usersharedpreferences.init();
    Future.delayed(
      Duration(seconds: 4),
          () {

        bool? loginstatus=Usersharedpreferences.getLogin() ?? false;
        if(loginstatus==true)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));

          }
        else {
          bool? status = Usersharedpreferences.getFirstTime() ?? false;
          if (status == false) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Intro1()));
          }
          else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Loginscreen()),
            );
          }
        }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Set your desired background color here
      body: Center(
        child: Icon(
          Icons.flag_circle,
          size: 300,
          color: Colors.black, // Optional: set the icon color to contrast with the background
        ),
      ),
    );
  }
}
