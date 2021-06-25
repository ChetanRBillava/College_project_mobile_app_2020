
import 'package:mitk_final_year_project_2020/UI/Index.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class InitialAPI extends StatefulWidget {
  @override
  _InitialAPIState createState() => _InitialAPIState();
}

class _InitialAPIState extends State<InitialAPI> {

  @override
  void initState() {
    setState(() {
      stationaryItems();
    });
    // loading = true;
    super.initState();
  }

  Future<String> stationaryItems() async {
    print('Entered stationaryItems page................');
    stationary.clear();
    String url = domainURL+'disp_stationary.php';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    for(int i=0 ; i < datadecode.length ; i++){
      print(datadecode[i]);
      stationary.add(datadecode[i]);
    }
    /*if (response.statusCode == 200) {
      print('register was successful............................');
      Fluttertoast.showToast(msg: 'Loading....');
      final datadecode = json.decode(response.body);
      print(datadecode);
    }
    else {
      isClicked = false;
      Fluttertoast.showToast(msg: 'Sorry something went wrong!!!');
      print('register was a failure............................');
    }*/
    personalDetails();
  }

  Future<String> personalDetails() async {
    print('Entered personalDetails page................');
    studentDetails.clear();
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_student.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    studentDetails.add(datadecode[0]);
    print(studentDetails[0]);
    if(studentDetails[0]['student_type'] == 'Hostelite'){
      hostelDetail();
    }
    else{
      leave();
    }
    /*for(int i=0 ; i < datadecode.length ; i++){
      print(datadecode[i]);
      studentDetails.add(datadecode[0]);
    }*/
  }

  Future<String> hostelDetail() async {
    print('Entered hostelDetails page................');
    hostelDetails.clear();
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_hostel.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    hostelDetails.add(datadecode[0]);
    print(hostelDetails[0]);
    /*for(int i=0 ; i < datadecode.length ; i++){
      print(datadecode[i]);
      studentDetails.add(datadecode[0]);
    }*/
    leave();
  }

  Future<String> leave() async {
    print('Entered leave page................');
    leaves.clear();
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_request.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    for(int i=0 ; i < datadecode.length ; i++){
      print(datadecode[i]);
      leaves.add(datadecode[i]);
    }
    admissions();
  }

  Future<String> admissions() async {
    print('Entered admissions page................');
    admission.clear();
    String url = domainURL+'admission_pay_display.php';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'localhost': '8000',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    for(int i=0 ; i < datadecode.length ; i++){
      print(datadecode[i]);
      admission.add(datadecode[i]);
    }
    if(studentDetails[0]["student_type"] == 'hostelite'){
      messbill();
    }
    else{
      purchaseHistory();
    }
  }

  Future<String> messbill() async {
    print('Entered messbill page................');
    mess.clear();
    String url = domainURL+'disp_messbill.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'localhost': '8000',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    mess.add(datadecode);
    print(mess[0]["date"].substring(0,19));
    transDate = (DateTime.now()).toString().substring(0,19);
    print(transDate);
    dateDiff = DateTime.parse(transDate).difference(DateTime.parse(mess[0]["date"].substring(0,10))).inDays;
    print(dateDiff);
    print(dateDiff.runtimeType);

    var leaveDiff, leaveDiff2, leaveDiff3;
    print(mess[0]["leaves"]["difference"]);
    print(mess[0]["leaves"]["dates"]);
    final leaves = json.decode(mess[0]["leaves"]["dates"]);
    print(leaves);
    print(leaves.length);
    for(int i=0 ; i < leaves.length ; i++){
      if(leaves[i]["leave_status"] == 'Approved'){
        print(leaves[i]);
        leaveDiff = DateTime.parse(leaves[i]["leave_till"]).difference(DateTime.parse(leaves[i]["leave_from"])).inDays;
        print(leaveDiff);
        if(leaveDiff >= mess[0]["leaves"]["difference"]){
          print('yes');

          print(mess[0]["date"].substring(0,10));
          print(transDate);
          print('dateDiff: '+ dateDiff.toString());

          print(leaves[i]["leave_from"]);
          print(leaves[i]["leave_till"]);
          print('leaveDiff: '+ leaveDiff.toString());

          leaveDiff2 = DateTime.parse(leaves[i]["leave_from"]).difference(DateTime.parse(mess[0]["date"].substring(0,10))).inDays;
          print(mess[0]["date"].substring(0,10));
          print(leaves[i]["leave_from"]);
          print('leaveDiff2: '+ leaveDiff2.toString());

          leaveDiff3 = DateTime.parse(transDate).difference(DateTime.parse(leaves[i]["leave_till"])).inDays;
          print(leaves[i]["leave_till"]);
          print(transDate);
          print('leaveDiff3: '+ leaveDiff3.toString());

          if(leaveDiff2 >= 0 && leaveDiff3 >= 0){
            dateDiff -= leaveDiff;
          }
        }
        else {
          print('no');
        }
      }
    }
    print(dateDiff);
    purchaseHistory();
  }

  Future<String> purchaseHistory() async {
    print('Entered purchaseHistory page................');
    purchases.clear();
    //String studMail = "sadhviah@gmail.com";
    print(studMail);
    String url = domainURL+'view_paysingle.php?email=$studMail';
    print(url);

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print(response.body);
    if(response.body != '\"no data\"'){
      final datadecode = json.decode(response.body);
      print(datadecode);
      print(datadecode.length);
      for(int i=0 ; i < datadecode.length ; i++){
        print(datadecode[i]);
        purchases.add(datadecode[i]);
      }
      hostelPayHistory();
    }
    else{
      hostelPayHistory();
    }
  }

  Future<String> hostelPayHistory() async {
    print('Entered purchaseHistory page................');
    hostelPayment.clear();
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_payhostel_single.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'localhost': '8000',
    });
    print(response.body);
    if(response.body != '\"No data found\"'){
      final datadecode = json.decode(response.body);
      print(datadecode);
      print(datadecode.length);
      for(int i=0 ; i < datadecode.length ; i++){
        print(datadecode[i]);
        hostelPayment.add(datadecode[i]);
      }
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Index(title: 'Welcome',)),
      );
    }
    else{
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Index(title: 'Welcome',)),
      );
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
