import 'dart:convert';

import 'package:mitk_final_year_project_2020/UI/Index.dart';
import 'package:mitk_final_year_project_2020/UI/ViewLeave.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApplyLeaveAPI extends StatefulWidget {
  @override
  _ApplyLeaveAPIState createState() => _ApplyLeaveAPIState();
}

class _ApplyLeaveAPIState extends State<ApplyLeaveAPI> {

  @override
  void initState() {
    setState(() {
      applyleave();
    });
    // loading = true;
    super.initState();
  }

  Future<String> test() async{
    String data = 'hello';
    print("Entered test...........");

    var url = domainURL+"test.php";
    var response = await http.post(url, body: {
      "data":"chetan",
    });

    print('Status code: '+response.statusCode.toString());
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "success");
      var body = jsonDecode(response.body);
      print(body);
    }
    else{
      Fluttertoast.showToast(msg: "error");
      var body = jsonDecode(response.body);
      print(body);
    }

  }

  Future<String> applyleave() async {

    print('Entered apply leave page................');
    var reasons = reason.text
    ;

    var url = domainURL+"request_leave.php";
    var data = {
      "email":studMail,
      "leave_type":leaveType,
      "leave_from":startDate,
      "leave_till":endDate,
      "return_date":returningDate,
      "reason":reasons
    };
    print(url);
    print(data);
    var response = await http.post(url, body: data);

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body);
    Fluttertoast.showToast(msg: body["message"]);
    viewLeave();
  }

  Future<String> viewLeave() async {
    print('Entered viewLeave page................');
    leaves.clear();
    total = 0;
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_leave.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final datadecode = json.decode(response.body);
    print(datadecode.length);
    print(datadecode);
    print('code: '+datadecode["code"].toString());
    if(datadecode["code"] == 200){
      print(datadecode["data"]);
      final dataredecode = json.decode(datadecode["data"]);
      print(dataredecode.length);
      for(int i=0 ; i < dataredecode.length ; i++){
        print(i);
        print(dataredecode[i]);
        leaves.add(dataredecode[i]);
      }
    }
    print('leaves length: '+leaves.length.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewLeave()),
    );
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
