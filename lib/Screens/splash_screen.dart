
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/BottomNavigatorBar/bottom_navigator_bar.dart';
import 'package:mom_doctor/Screens/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  Future<bool> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    if (token != null) {
      Route newRoute = MaterialPageRoute<void>(builder: (context) =>BottomNavigatorBar());
      Navigator.pushReplacement(context, newRoute);
      return true;
    } else {
      Route newRoute = MaterialPageRoute<void>(builder: (context) => LoginPage());
      Navigator.pushReplacement(context, newRoute);
      return false;
    }

  }

  void StartTimer() async {
    Timer(Duration(seconds: 3), () {
      getToken();
     /* Route newRoute = MaterialPageRoute<void>(builder: (context) =>BottomNavigatorBar());
      Navigator.pushReplacement(context, newRoute);*/
    });
  }


  @override
  void initState() {
    //getToken();
    super.initState();
    StartTimer();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/logo-mom.png"),
            padding: EdgeInsets.symmetric(horizontal: 80),
          ),
          Container(
            child: CircularProgressIndicator(
              color: purpleMainColor,
            ),
            padding: EdgeInsets.only(top: 42),
          ),
        ],
      ),
    );
  }
}
