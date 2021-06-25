
import 'dart:io';
import 'dart:math';
import 'package:mitk_final_year_project_2020/UI/CheckPassword.dart';
import 'package:mitk_final_year_project_2020/UI/HostelRoom.dart';
import 'package:mitk_final_year_project_2020/UI/Profile.dart';
import 'package:mitk_final_year_project_2020/UI/Register.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mitk_final_year_project_2020/TEST/containerTest.dart';
import 'package:mitk_final_year_project_2020/UI/AdmissionFee.dart';
import 'package:mitk_final_year_project_2020/UI/ApplyLeave.dart';
import 'package:mitk_final_year_project_2020/UI/Cart.dart';
import 'package:mitk_final_year_project_2020/UI/Index.dart';
import 'package:mitk_final_year_project_2020/UI/Purchases.dart';
import 'package:mitk_final_year_project_2020/UI/ViewLeave.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DialogModal.dart';
import 'GlobalVariables.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SideNavBar extends StatefulWidget {
  const SideNavBar({
    Key key,
  }) : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {

  Future<String> viewCart() async {
    print('Entered viewCart page................');
    cart.clear();
    total = 0;
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_cart.php?email=$studMail';

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
        cart.add(dataredecode[i]);
        total += int.parse(dataredecode[i]["quantity"]) * int.parse(dataredecode[i]["item_amount"]);
      }
    }
    print('Cart length: '+cart.length.toString());
    print('Rs.'+total.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cart()),
    );
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

  Future<String> viewPayment() async {
    print('Entered viewPayment page................');
    purchases.clear();
    total = 0;
    String url = domainURL+'view_payment.php?email=$studMail';

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
        purchases.add(dataredecode[i]);
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Purchases()),
    );
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
    if(mess[0]["date"]== null){
      Fluttertoast.showToast(msg: 'Please update your joining date', toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, textColor: Colors.white);
      isClicked = false;
    }
    else{
      print(mess[0]["date"].substring(0,10));
      transDate = (DateTime.now()).toString().substring(0,10);
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
      roomRent();
    }
  }

  Future<String> roomRent() async {
    print('Entered roomRent page................');
    rent.clear();
    String url = domainURL+'disp_room_rent.php?email=$studMail';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'localhost': '8000',
    });

    final datadecode = json.decode(response.body);
    print(datadecode);
    print(datadecode.length);
    rent.add(datadecode);
    print(rent[0]["date"].substring(0,10));
    transDate = (DateTime.now()).toString().substring(0,10);
    print(transDate);
    roomRentDateDiff = DateTime.parse(transDate).difference(DateTime.parse(rent[0]["date"].substring(0,10))).inDays;
    print(roomRentDateDiff);
    print(roomRentDateDiff.runtimeType);

    var leaveDiff, leaveDiff2, leaveDiff3;
    print(rent[0]["leaves"]["difference"]);
    print(rent[0]["leaves"]["dates"]);
    final leaves = json.decode(rent[0]["leaves"]["dates"]);
    print(leaves);
    print(leaves.length);
    for(int i=0 ; i < leaves.length ; i++){
      if(leaves[i]["leave_status"] == 'Approved'){
        print(leaves[i]);
        leaveDiff = DateTime.parse(leaves[i]["leave_till"]).difference(DateTime.parse(leaves[i]["leave_from"])).inDays;
        print(leaveDiff);
        if(leaveDiff >= rent[0]["leaves"]["difference"]){
          print('yes');

          print(rent[0]["date"].substring(0,10));
          print(transDate);
          print('roomRentDateDiff: '+ roomRentDateDiff.toString());

          print(leaves[i]["leave_from"]);
          print(leaves[i]["leave_till"]);
          print('leaveDiff: '+ leaveDiff.toString());

          leaveDiff2 = DateTime.parse(leaves[i]["leave_from"]).difference(DateTime.parse(rent[0]["date"].substring(0,10))).inDays;
          print(rent[0]["date"].substring(0,10));
          print(leaves[i]["leave_from"]);
          print('leaveDiff2: '+ leaveDiff2.toString());

          leaveDiff3 = DateTime.parse(transDate).difference(DateTime.parse(leaves[i]["leave_till"])).inDays;
          print(leaves[i]["leave_till"]);
          print(transDate);
          print('leaveDiff3: '+ leaveDiff3.toString());

          if(leaveDiff2 >= 0 && leaveDiff3 >= 0){
            roomRentDateDiff -= leaveDiff;
          }
        }
        else {
          print('no');
        }
      }
    }
    print(roomRentDateDiff);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdmissionFee()),
    );
  }

  Future<String> roommates() async {

    roomMateDetails.clear();
    print('Entered roommates api................');

    var url = domainURL+"roomMates.php";

    var response = await http.post(url, body: {
      "email": studMail,
      "room_id": 1.toString(),
    });

    var body = jsonDecode(response.body);
    print('Status code: '+body['code'].toString());
    print(body);
    if(body['code']==200){
      final datadecode = json.decode(body["data"]);
      print(datadecode.length);
      print(datadecode);
      for(int i=0 ; i < datadecode.length ; i++){
        print(datadecode[i]);
        roomMateDetails.add(datadecode[i]);
      }
    }
    print(roomMateDetails.length);
    //print(roomMateDetails[0]["student_name"]);
    Fluttertoast.showToast(msg: body["message"]);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HostelRoom()),
    );
  }

  Future<String> rooms() async {

    roomList.clear();
    print('Entered rooms api................');

    var url = domainURL+"rooms.php";
    print(studentDetails[0]["gender"]);
    var response = await http.post(url, body: {
      "gender": studentDetails[0]["gender"]
    });

    var body = jsonDecode(response.body);
    print('Status code: '+body['code'].toString());
    if(body['code']==200){
      final datadecode = json.decode(body["data"]);
      print(datadecode.length);
      print(datadecode);
      for(int i=0 ; i < datadecode.length ; i++){
        print(datadecode[i]);
        roomList.add(datadecode[i]);
      }
    }
    print(roomList.length);
    print(roomList[0]["room_num"]);
    Fluttertoast.showToast(msg: body["message"]);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HostelRoom()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width,
                color: Colors.purpleAccent,
                child: Center(
                  child: Text(
                    'Welcome ' + studentDetails[0]["name"],
                    //'Welcome chetan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.86,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            //Home
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: InkWell(
                                splashColor: Colors.blue,
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Index(title: 'Home',)),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.home),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Home'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Apply Leave
                            studentDetails[0]["student_type"] == 'Hostelite' ? Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ApplyLeave()),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.add_to_photos_rounded),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Apply Leave'),
                                    ),
                                  ],
                                ),
                              ),
                            ) : SizedBox.shrink(),
                            //View Leave
                            studentDetails[0]["student_type"] == 'Hostelite' ? Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    viewLeave();
                                    /*isClicked = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ViewLeave()),
                                    );*/
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.assignment),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('View Leaves'),
                                    ),
                                  ],
                                ),
                              ),
                            ) : SizedBox.shrink(),
                            //Pay Fee
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    if(studentDetails[0]["student_type"] == 'Hostelite'){
                                      messbill();
                                    }
                                    else{
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AdmissionFee()),
                                      );
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.account_balance_wallet_sharp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Pay Fee'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Purchase History
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    viewPayment();
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.assignment_turned_in_rounded),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Purchase History'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Cart
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    viewCart();
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Cart'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Profile
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Profile()),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.person),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Profile'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Hostel Room
                            studentDetails[0]["student_type"] == 'Hostelite' ? Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    //isClicked = true;
                                    print(hostelDetails[0]["room_id"]);
                                    print(hostelDetails[0]["room_num"]);
                                    if(hostelDetails[0]["room_id"] == null || hostelDetails[0]["room_num"] == null){
                                      rooms();
                                    }
                                    else{
                                      roommates();
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.apartment_outlined),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Hostel Room'),
                                    ),
                                  ],
                                ),
                              ),
                            ) : SizedBox.shrink(),
                            //Change Password
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CheckPassword()),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.edit),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Update Password'),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //Logout
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  if(isClicked == false){
                                    isClicked = true;
                                    showAlertDialog(context);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.logout),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Logout'),
                                    ),
                                  ],
                                ),
                              ),
                            ),



                            //test
                            /*Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                              child: GestureDetector(
                                onTap: (){
                                  Random random = new Random();
                                  int randomNumber = random.nextInt(1000000);
                                  print(randomNumber);
                                  transOTP = null;
                                  print(transOTP);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Icon(Icons.radio_button_checked),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                      child: Text('Test random number'),
                                    ),
                                  ],
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
