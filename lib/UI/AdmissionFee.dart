import 'dart:convert';

import 'package:mitk_final_year_project_2020/API/PaymentAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'HostelRoom.dart';

class AdmissionFee extends StatefulWidget {
  @override
  _AdmissionFeeState createState() => _AdmissionFeeState();
}

class _AdmissionFeeState extends State<AdmissionFee> {

  @override
  void initState() {
    isClicked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'College App',
              ),
              backgroundColor: Colors.purpleAccent,
            ),
            drawer: SideNavBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      child: Stack(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: admission.length,
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int i) {
                              if(i == 0){
                                return Column(
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                    studentDetails[0]["student_type"] == 'Hostelite' && dateDiff > 0 ? Mess() : SizedBox.shrink(),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                    studentDetails[0]["student_type"] == 'Hostelite' && roomRentDateDiff > 0 ? RoomRent() : SizedBox.shrink(),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                    AdmissionFees(index: i),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  AdmissionFees(index: i),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                                ],
                              );
                            },),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}



class AdmissionFees extends StatefulWidget {
  AdmissionFees({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  _AdmissionFeesState createState() => _AdmissionFeesState();
}

class _AdmissionFeesState extends State<AdmissionFees> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width*0.84,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Admission Fees', textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Year: '+admission[widget.index]["for_year"].toString(), textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fee: '+admission[widget.index]["amount"].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.shortestSide*0.04
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        child: GestureDetector(
                          onTap: (){
                            transDetails = admission[widget.index]["for_year"]+' Admission fee';
                            paymentFor = 'Admission fee';
                            transType = 'online';
                            transAmount = 'Rs.'+admission[widget.index]["amount"]/*.substring(4,admission[widget.index]["amount"].length)*/.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentAPI()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'pay fees',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}



class Mess extends StatefulWidget {

  @override
  _MessState createState() => _MessState();
}

class _MessState extends State<Mess> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width*0.84,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Mess Fees', textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'From: '+ (mess[0]["date"].substring(0,10).toString()), textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Fee: '+((dateDiff)*int.parse(mess[0]["amount"])).toString(), textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        child: GestureDetector(
                          onTap: (){
                            transDetails = mess[0]["m_details"]+' Mess bill from: '+ (mess[0]["date"].substring(0,10).toString());
                            paymentFor = 'Mess bill';
                            transType = 'online';
                            transAmount = 'Rs.'+((dateDiff)*int.parse(mess[0]["amount"])).toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentAPI()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'pay fees',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


class RoomRent extends StatefulWidget {
  @override
  _RoomRentState createState() => _RoomRentState();
}

class _RoomRentState extends State<RoomRent> {
  @override
  void initState() {
    super.initState();
  }
  Future<String> rooms() async {

    roomList.clear();
    print('Entered roommates api................');

    var url = domainURL+"rooms.php";


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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width*0.84,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Room Rent', textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'From: '+ (rent[0]["date"].substring(0,10).toString()), textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                hostelDetails[0]["room_id"] != null ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Room rent: '+((roomRentDateDiff)*int.parse(hostelDetails[0]["room_rent"])).toString(), textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ) :
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Join your room now', textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                hostelDetails[0]["room_id"] != null ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        child: GestureDetector(
                          onTap: (){
                            transDetails = mess[0]["m_details"]+' Room rent';
                            paymentFor = 'Room rent';
                            transType = 'online';
                            transAmount = 'Rs.'+((roomRentDateDiff)*int.parse(hostelDetails[0]["room_rent"])).toString();
                            print('transDetails: '+transDetails);
                            print('paymentFor: '+paymentFor);
                            print('transType: '+transType);
                            print('transAmount: '+transAmount);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentAPI()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'pay fees',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ) :
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        child: GestureDetector(
                          onTap: (){
                            rooms();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'click here!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
