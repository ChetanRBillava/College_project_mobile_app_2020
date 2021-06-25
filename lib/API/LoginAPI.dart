import 'dart:convert';

import 'package:mitk_final_year_project_2020/UI/Index.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'InitialAPI.dart';

class LoginApiCall extends StatefulWidget {
  @override
  _LoginApiCallState createState() => _LoginApiCallState();
}

class _LoginApiCallState extends State<LoginApiCall> {

  @override
  void initState() {
    setState(() {
      login();
    });
    // loading = true;
    super.initState();
  }

  Future<String> test() async{
    var mail = loginMailController.text,
        password = loginPwdController.text
    ;
    print("Entered test...........");

    var url = domainURL+"login.php";
    var response = await http.post(url, body: {
      "email": mail,
      "pswd": password,
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body["message"]);
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "success");
    }
    else{
      Fluttertoast.showToast(msg: "error");
    }

  }

  Future<String> login() async {

    print('Entered login details page................');
    var mail = loginMailController.text,
        password = loginPwdController.text
    ;

    var url = domainURL+"login.php";
    print(url);
    var response = await http.post(url, body: {
      "email": mail,
      "pswd": password,
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body);

    Fluttertoast.showToast(msg: body["message"],backgroundColor: Colors.green,textColor: Colors.black, toastLength: Toast.LENGTH_LONG);
    if(body["code"] == 200){
      studMail = mail;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InitialAPI()),
      );
    }
    else{
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.blue,
            size: 100,
          ),
        ),
      ),
    );
  }

}
