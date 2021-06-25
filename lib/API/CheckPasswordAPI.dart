import 'dart:convert';

import 'package:mitk_final_year_project_2020/UI/UpdatePassword.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class CheckPasswordAPI extends StatefulWidget {
  @override
  _CheckPasswordAPIState createState() => _CheckPasswordAPIState();
}

class _CheckPasswordAPIState extends State<CheckPasswordAPI> {

  @override
  void initState() {
    setState(() {
      checkPassword();
    });
    // loading = true;
    super.initState();
  }

  Future<String> checkPassword() async {

    print('Entered checkPassword page................');
    var mail = studMail,
        password = oldPwd.text
    ;
    print(password);
    var url = domainURL+"checkPassword.php";
    var response = await http.post(url, body: {
      "email": mail,
      "pwd": password,
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body);

    Fluttertoast.showToast(msg: body["message"],backgroundColor: Colors.yellow,textColor: Colors.black);
    if(body["code"] == 200){
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdatePassword()),
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
