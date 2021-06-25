import 'package:mitk_final_year_project_2020/API/ApplyLeaveAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class ApplyLeave extends StatefulWidget {
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {

  DateTime selectedDate = DateTime.now();
  String fromDate = "click here", toDate = "click here", returnDate = "click here", leaveTypeDropdownValue = leaveTypes[0];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    leaveType = leaveTypes[0];
    isClicked = false;
    super.initState();
  }
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print("printing.....");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ApplyLeaveAPI()),
      );
    }
    else {
      print('Form is invalid');
      Fluttertoast.showToast(msg: "Form is invalid");
    }
  }

  fromDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate){
      fromDate = picked.toString();
      setState(() {
        fromDate = fromDate.substring(0,10);
      });
      startDate = fromDate;
    }
  }

  toDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate){
      toDate = picked.toString();

      setState(() {
        toDate = toDate.substring(0,10);
      });
      endDate = toDate;
    }
  }

  returnDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate){
      returnDate = picked.toString();

      setState(() {
        returnDate = returnDate.substring(0,10);
      });
      returningDate = returnDate;
    }
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/applyForm.json',
                          height: MediaQuery.of(context).size.height*0.3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadingText(titleText: 'Apply Leave', colorUsed: Colors.black),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [

                          //Leave type
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Choose Leave type",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.deepPurple,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: leaveTypeDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        leaveTypeDropdownValue = newValue;
                                        leaveType = leaveTypeDropdownValue;
                                        print(leaveType);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: leaveTypes
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child:
                                        Container(
                                            width: MediaQuery.of(context).size.width*0.9,
                                            child: BodyText(titleText: value, textSize: 0.048, colorUsed: Colors.white)
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Leave from
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select start date",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  fromDatePicker(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.deepPurple,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            fromDate,
                                            style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          //Leave till
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select end date",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  toDatePicker(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.deepPurple,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            toDate,
                                            style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          //return date
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select return date",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  returnDatePicker(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.deepPurple,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            returnDate,
                                            style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context).size.shortestSide*0.048
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          //reason
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              controller: reason,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Reason',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),

                          //register
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.purple,
                              ),
                              child: Text(
                                "Apply",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height*0.025),
                              ),
                            ),
                            onTap: validateAndSave,
                          ),
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
