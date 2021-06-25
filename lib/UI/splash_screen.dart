import 'package:mitk_final_year_project_2020/UI/Login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new Login(),
          image: Image.asset('assets/logo.png',
            width: MediaQuery.of(context).size.width*0.4,
            height: MediaQuery.of(context).size.height*0.2,
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.purpleAccent,
          photoSize: MediaQuery.of(context).size.height*0.3,
          loaderColor: Colors.white,
          /*loadingText: Text(
            'Designed and developed by Protriden Technologies',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.shortestSide*0.04,
                fontWeight: FontWeight.bold
            ),
          ),*/
        ),
      ),
    );

  }
}
