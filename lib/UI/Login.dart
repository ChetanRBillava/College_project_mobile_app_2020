import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:mitk_final_year_project_2020/API/InitialAPI.dart';
import 'package:mitk_final_year_project_2020/API/LoginAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>(), testIMG;

  String user;
  String email;
  String password = '123456';
  String checkBoxString = 'Show password';

  bool checkBoxValue = false;
  bool _obscureText = true;

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print("printing.....");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginApiCall()),
      );
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InitialAPI()),
      );*/
    }
    else {
      isClicked = false;
      print('Form is invalid');
      Fluttertoast.showToast(msg: "Form is invalid");
    }
  }


  void _showPicker(context) {
    debugPrint("clicking..............");
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source, imageQuality: 18);
    var img2 = selected;
    List<int> imageBytes = img2.readAsBytesSync();
    print('imageBytes: '+imageBytes.toString());
    testIMG = base64.encode(imageBytes);
    print('base64Image : '+testIMG);
    print('Image picked');
    test();
    /*setState(() {
      _imageFile = selected;
    });

    apiType='image';
    apiBody={
      "d_id": driverDetails[0]['d_id'],
      "d_profile_pik": driverPic,
    };

    Timer(Duration(seconds: 1), () {
      callAPI();
    });*/
  }

  Future<String> test() async{
    print("Entered test...........");

    var url = domainURL+"uploadTest.php";
    var response = await http.post(url, body: {
      "uploadfile": testIMG,
    });

    print('Status code: '+response.statusCode.toString());
    print(response.body);
    var body = jsonDecode(response.body);
    print(body["message"]);
    /*if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "success");
    }
    else{
      Fluttertoast.showToast(msg: "error");
    }*/

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
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
                GestureDetector(
                  //onTap: () => _showPicker(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadingText(titleText: 'Login', colorUsed: Colors.black),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //e-mail
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.025),
                          controller: loginMailController,
                          validator: (value) {
                            if(!EmailValidator.validate(value)){
                              return "Please enter proper email!!";
                            }
                            else{
                              return null;
                            }
                          },
                          /*validator: (String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid email';
                              }
                              return value;
                            },*/
                          decoration:InputDecoration(
                              labelText: "User Id",
                              labelStyle:TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025),
                              errorStyle: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )),
                        ),
                      ),

                      //password
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.025),
                          controller: loginPwdController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter a valid password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:TextStyle(color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height*0.025),
                              errorStyle: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )),
                        ),
                      ),

                      //show password
                      Row(
                        children: [
                          Checkbox(
                              value: checkBoxValue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkBoxValue = newValue;
                                  print(checkBoxValue);
                                  if(checkBoxValue){
                                    checkBoxString = "Hide password";
                                  }
                                  else{
                                    checkBoxString = "Show password";
                                  }
                                  print(checkBoxString);
                                  _obscureText = !_obscureText;
                                });
                              }),
                          Text(
                            checkBoxString,
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      //submit
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
                            "Login",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.height*0.025),
                          ),
                        ),
                        onTap: validateAndSave,
                      ),

                      //forgot password
                      /*Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("forgot password?"),
                          ),
                        ],
                      ),*/

                      //signup
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("New User? SignUp",style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
