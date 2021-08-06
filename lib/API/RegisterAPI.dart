import 'dart:convert';

import 'package:mitk_final_year_project_2020/UI/Login.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class RegisterAPI extends StatefulWidget {
  @override
  _RegisterAPIState createState() => _RegisterAPIState();
}

class _RegisterAPIState extends State<RegisterAPI> {

  @override
  void initState() {
    setState(() {
      register();
    });
    // loading = true;
    super.initState();
  }

  Future<String> register() async {

    print('Entered register details page................');

    var name = regNameController.text,
        mail = regMailController.text,
        phone = regPhoneController.text,
        address = regAddressController.text,
        guardianName = regGuardNameController.text,
        guardianMail = regGuardMailController.text,
        guardianPhone = regGuardPhoneController.text,
        sslc = regSSLCController.text,
        puc = regPUCController.text
    ;
    /*print('name: '+name);
    print('gender: '+gen);
    print('semester: '+semester);
    print('mail: '+mail);
    print('phone: '+phone);
    print('address: '+address);
    print('branch: '+branch);
    print('guardianName: '+guardianName);
    print('guardianMail: '+guardianMail);
    print('guardianPhone: '+guardianPhone);
    print('sslc: '+sslc);
    print('mail: '+puc);
    print('branch: '+studentStatus);
    print('branch: '+studentType);*/
    var url = domainURL+"register.php";
    var data={
      "name": name,
      "gender": gen,
      "sem": semester,
      "email": mail,
      "phone": phone,
      "address": address,
      "branch": branch,
      "guardian_name": guardianName,
      "guardian_phone": guardianPhone,
      "guardian_email": guardianMail,
      "sslc_percent": sslc,
      "puc_percent": puc,
      "admission_type": admissionType,
      "admission_fees": regAdmissionFeesController.text,
      "student_type": studentType
    };
    print(url);
    print(data);

    var response = await http.post(url, body: data);
    var body = jsonDecode(response.body);
    print('Status code: '+body["code"].toString());
    print(body["message"]);
    if(body["code"] == 200){
      Fluttertoast.showToast(
          msg: "A mail will be sent after the admin verifies your data. Please keep checking your mail",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
    else{
      Fluttertoast.showToast(msg: response.body);
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
