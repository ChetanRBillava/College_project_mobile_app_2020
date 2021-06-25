import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HostelRoom extends StatefulWidget {
  @override
  _HostelRoomState createState() => _HostelRoomState();
}

class _HostelRoomState extends State<HostelRoom> {
  var rid, rno, rent, orid = hostelDetails[0]["room_id"], orno = hostelDetails[0]["room_num"];

  Future<String> allotRoom() async {

    print('Entered allotRoom api................');
    if(orid == null){
      orid = 0;
      orno = 0;
    }
    print(orid);
    var url = domainURL+"allottRoom.php";
    var response = await http.post(url, body: {
      "email": studMail,
      "old_room_id": orid.toString(),
      "old_room_num": orno.toString(),
      "room_id": rid,
      "room_num": rno,
      "room_rent": rent,
    });

    print(response.body);
    var body = jsonDecode(response.body);
    print('Status code: '+body['code'].toString());
    if(body['code']==200){
      /*final datadecode = json.decode(body["data"]);
      print(datadecode.length);
      print(datadecode);
      for(int i=0 ; i < datadecode.length ; i++){
        print(datadecode[i]);
        roomMateDetails.add(datadecode[i]);
      }
      print(roomMateDetails.length);
      print(roomMateDetails[0]["student_name"]);*/
      hostelDetails[0]["room_id"]=rid;
      hostelDetails[0]["room_num"]=rno;
      print(hostelDetails[0]["room_id"]);
      print(hostelDetails[0]["room_num"]);
      Fluttertoast.showToast(msg: body["message"]);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HostelRoom()),
      );
    }
    else{
      Fluttertoast.showToast(msg: body["message"]);
      //Navigator.pop();
    }
  }

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
                'Hostel Room',
              ),
              backgroundColor: Colors.purpleAccent,
            ),
            drawer: SideNavBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      child: Container(
                        //width: MediaQuery.of(context).size.width,
                        height:  MediaQuery.of(context).size.height*0.6,
                        child: Image.asset(
                            'assets/mitk.png',
                            //height:  MediaQuery.of(context).size.height*0.18,
                            fit: BoxFit.cover
                        ),
                      )
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.5,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          //height: MediaQuery.of(context).size.height*0.6,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: Colors.red[500],
                            ),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40))
                            ,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      height: 4,
                                      width: MediaQuery.of(context).size.width*0.2,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                    child: Text(
                                      'Hi '+studentDetails[0]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.05
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              hostelDetails[0]["room_num"] != null ? Column(
                                children: [
                                  //Room Number
                                  Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                              child: Text(
                                                'Your hostel room number:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.9,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.red[500],
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                                ,
                                              ),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                child: Text(
                                                  hostelDetails[0]["room_num"],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 4,
                                          width: MediaQuery.of(context).size.width*0.14,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 4,
                                          width: MediaQuery.of(context).size.width*0.14,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 4,
                                          width: MediaQuery.of(context).size.width*0.14,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 4,
                                          width: MediaQuery.of(context).size.width*0.14,
                                        )
                                      ],
                                    ),
                                  ),
                                  //Roommates
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                        child: Text(
                                          'Your roommates:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context).size.shortestSide*0.05
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  roomMateDetails.length != 0 ? Container(
                                    height: ((MediaQuery.of(context).size.height*0.45)*(roomMateDetails.length)),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount:roomMateDetails.length,
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int i) {
                                              return Padding(
                                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                child: Column(
                                                  children: [
                                                    //Name
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                              child: Text(
                                                                'Name:',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width*0.9,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                border: Border.all(
                                                                  color: Colors.red[500],
                                                                ),
                                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                                                ,
                                                              ),
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                                child: Text(
                                                                  roomMateDetails[i]["student_name"],
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: MediaQuery.of(context).size.shortestSide*0.04,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    //Phone Number
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                              child: Text(
                                                                'Phone Number:',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width*0.9,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                border: Border.all(
                                                                  color: Colors.red[500],
                                                                ),
                                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                                                ,
                                                              ),
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                                child: Text(
                                                                  roomMateDetails[i]["phone_no"],
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    //Joining Date
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                              child: Text(
                                                                'Joining Date:',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width*0.9,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                border: Border.all(
                                                                  color: Colors.red[500],
                                                                ),
                                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                                                ,
                                                              ),
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                                                child: Text(
                                                                  roomMateDetails[i]["join_date"]!= null ? roomMateDetails[i]["join_date"] : 'Not yet joined',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'No roommates found',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.05
                                      ),
                                    ),
                                  ),
                                ],
                              ) :
                              Column(
                                children: [
                                  Container(
                                    //color: Colors.green,
                                    height: ((MediaQuery.of(context).size.height*0.3)*(roomList.length)),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount:roomList.length,
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int i) {
                                              return Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Card(
                                                    elevation: 20,
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*0.94,
                                                      color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    //height:  MediaQuery.of(context).size.height*0.3,
                                                                    width: MediaQuery.of(context).size.width*0.3,
                                                                    child: FadeInImage.assetNetwork(
                                                                        placeholder: 'assets/logo.png',
                                                                        image: 'https://images.citizenmatters.in/wp-content/uploads/sites/3/2018/10/29134709/IMG-20181019-WA0003-678x381.jpg',
                                                                        height:  MediaQuery.of(context).size.height*0.18,
                                                                        fit: BoxFit.cover
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              //SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [

                                                                      Padding(
                                                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                                                        child: Container(
                                                                          //width: MediaQuery.of(context).size.width*0.9,
                                                                          child: Text(
                                                                            'Room No.: '+roomList[i]["room_num"].toString(),
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                                                        child: Container(
                                                                          //width: MediaQuery.of(context).size.width*0.9,
                                                                          child: Text(
                                                                            'Rent: '+roomList[i]["rent"].toString(),
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                                                        child: Container(
                                                                          //width: MediaQuery.of(context).size.width*0.9,
                                                                          child: Text(
                                                                            'Type: '+roomList[i]["type"].toString(),
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                                                        child: Container(
                                                                          //width: MediaQuery.of(context).size.width*0.9,
                                                                          child: Text(
                                                                            'Maximum capacity: '+roomList[i]["max_capacity"].toString(),
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                                                        child: Container(
                                                                          //width: MediaQuery.of(context).size.width*0.9,
                                                                          child: Text(
                                                                            'Current count: '+roomList[i]["current_count"].toString(),
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          roomList[i]["max_capacity"] != roomList[i]["current_count"] ? Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    rid = roomList[i]["room_id"];
                                                                    rno = roomList[i]["room_num"];
                                                                    rent = roomList[i]["rent"];
                                                                    print('Old room id: '+hostelDetails[0]["room_id"].toString());
                                                                    print('Old room num: '+hostelDetails[0]["room_num"].toString());
                                                                    print('rid: '+rid);
                                                                    print('rno: '+rno);
                                                                    print('rent: '+rent);
                                                                    allotRoom();
                                                                  },
                                                                  child: Container(
                                                                    color: Colors.green,
                                                                    //width: MediaQuery.of(context).size.width*0.4,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Text(
                                                                        'Join room',
                                                                        style: TextStyle(
                                                                            color: Colors.white
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: MediaQuery.of(context).size.width*0.02,)
                                                            ],
                                                          ) : SizedBox.shrink()
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
