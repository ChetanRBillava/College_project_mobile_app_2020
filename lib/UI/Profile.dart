import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    isClicked = false;
    print(studentDetails[0]);
    print(studentDetails[0]["name"]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
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
                        SizedBox(height: MediaQuery.of(context).size.height*0.4,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          //height: MediaQuery.of(context).size.height*0.6,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                color: Colors.red[500],
                              ),
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(70),topRight:Radius.circular(70))
,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                    Container(
                                      color: Colors.white,
                                      height: 4,
                                      width: MediaQuery.of(context).size.width*0.2,
                                    )
                                  ],
                                ),
                              ),
                              //name
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Name',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["name"],
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
                              //gender
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Gender',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["gender"],
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
                              //sem
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Semester',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["sem"],
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
                              //email
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'E-Mail',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["email"],
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
                              //phone
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Phone Number',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["phone"],
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
                              //address
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Address',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["address"],
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
                              //branch
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Branch',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["branch"],
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
                              //guardian_name
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Guardian Name',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["guardian_name"],
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
                              //guardian_phone
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Guardian Phone Number',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["guardian_phone"],
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
                              //guardian_email
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Guardian E-mail',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["guardian_email"],
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
                              //sslc_percent
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'SSLC Percentage',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["sslc_percent"],
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
                              //puc_percent
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'PUC Percentage',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["puc_percent"],
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
                              //student_type
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                          child: Text(
                                            'Student Type',
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
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                                            child: Text(
                                              studentDetails[0]["student_type"],
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
                              )
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
