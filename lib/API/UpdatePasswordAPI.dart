import 'dart:convert';

import 'package:mitk_final_year_project_2020/UI/Login.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class UpdatePasswordAPI extends StatefulWidget {
  @override
  _UpdatePasswordAPIState createState() => _UpdatePasswordAPIState();
}

class _UpdatePasswordAPIState extends State<UpdatePasswordAPI> {

  @override
  void initState() {
    setState(() {
      updatePassword();
    });
    // loading = true;
    super.initState();
  }

  Future<String> updatePassword() async {

    print('Entered checkPassword page................');
    var mail = studMail,
        password = newPwd.text
    ;
    print(password);
    var url = domainURL+"updatePassword.php";
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
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
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
