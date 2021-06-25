import 'package:mitk_final_year_project_2020/API/RegisterAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    branch = branchList[0];
    gen=gender[0];
    semester=sem[0];
    studentType = stuType[0];
    studentStatus = stuStatus[0];
    print(branchDropdownValue);
    super.initState();
  }
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print("printing.....");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterAPI()),
      );
     /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );*/
    }
    else {
      print('Form is invalid');
      Fluttertoast.showToast(msg: "Form is invalid");
    }
  }
  String stuTypeDropdownValue = stuType[0], branchDropdownValue = branchList[0],
      stuStatusDropdownValue = stuStatus[0], genderDropdownValue = gender[0], semDropdownValue = sem[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/login_bg.png'),
                            fit: BoxFit.fill,
                          )),
                      child: Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit:BoxFit.cover,
                                image: AssetImage('assets/logo.png'),
                              )),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadingText(titleText: 'Register', colorUsed: Colors.black),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //name
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              controller: regNameController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              /*validator: (String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid email';
                              }
                              return value;
                            },*/
                              decoration:InputDecoration(
                                  labelText: 'Enter Name',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //gender
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select Gender",
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
                                    value: genderDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        genderDropdownValue = newValue;
                                        gen = genderDropdownValue;
                                        print(gen);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: gender
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
                          //branch
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select branch",
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
                                    value: branchDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        branchDropdownValue = newValue;
                                        branch = branchDropdownValue;
                                        print(branch);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: branchList
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
                          //sem
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select semester",
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
                                    value: semDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        semDropdownValue = newValue;
                                        semester = semDropdownValue;
                                        print(semester);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: sem
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
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          //phone number
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              controller: regPhoneController,
                              validator: (value) =>
                              value.length != 10 ? 'Please recheck your number' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter Phone Number',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //email
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: regMailController,
                              validator: (value) {
                                if(!EmailValidator.validate(value)){
                                  return "Please enter proper email!!";
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration:InputDecoration(
                                  labelText: 'Enter Email',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //address
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.streetAddress,
                              minLines: 4,
                              maxLines: 8,
                              controller: regAddressController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter address',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          //guardian name
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.text,
                              controller: regGuardNameController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter Guardian Name',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //guardian phone number
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.number,
                              controller: regGuardPhoneController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter Guardian Phone Number',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //guardian email
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: regGuardMailController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter Email',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),


                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          //SSLC
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.number,
                              controller: regSSLCController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter SSLC percentage',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),
                          //PUC
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025
                              ),
                              keyboardType: TextInputType.number,
                              controller: regPUCController,
                              validator: (value) =>
                              value.isEmpty ? 'This field cannot be blank' : null,
                              decoration:InputDecoration(
                                  labelText: 'Enter PUC percentage',
                                  labelStyle:TextStyle(color: Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*0.025),
                                  errorStyle: TextStyle(
                                      color: Colors.pinkAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          //studentStatus
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Set Student status",
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
                                    value: stuStatusDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        stuStatusDropdownValue = newValue;
                                        studentStatus = stuStatusDropdownValue;
                                        print(studentStatus);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: stuStatus
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
                          //studentType
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Set Student type",
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
                                    value: stuTypeDropdownValue,
                                    dropdownColor: Colors.deepPurple,
                                    iconSize: 24,
                                    iconEnabledColor: Colors.white,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        stuTypeDropdownValue = newValue;
                                        studentType = stuTypeDropdownValue;
                                        print(studentType);
                                        //vID = dropdownValue;

                                      });
                                    },
                                    items: stuType
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

                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
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
                                "Register",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.shortestSide*0.048),
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
