import 'package:mitk_final_year_project_2020/API/CheckPasswordAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckPassword extends StatefulWidget {
  @override
  _CheckPasswordState createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    isClicked = false;
    super.initState();
  }
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print("printing.....");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckPasswordAPI()),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadingText(titleText: 'Verfiy Password', colorUsed: Colors.black),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        //Old Password
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black,
                                fontSize: MediaQuery.of(context).size.height*0.025
                            ),
                            keyboardType: TextInputType.text,
                            controller: oldPwd,
                            validator: (value) =>
                            value.isEmpty ? 'This field cannot be blank' : null,
                            decoration:InputDecoration(
                                labelText: 'Enter Old Password',
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
                              "verify",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.048),
                            ),
                          ),
                          onTap: validateAndSave,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
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
