
import 'package:shared_preferences/shared_preferences.dart';

import 'GlobalVariables.dart';

addLoginStatusToSP(status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", status);
  print("addLoginStatusToSP visited..................");
}

addStudentDetailsToSP() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("studName", studName);
  prefs.setString("studMail", studMail);
  prefs.setInt("studPhone", studPhone);
  print("addStudentDetailsToSP visited..................");
}

getStudentDetails() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  studName = prefs.getString("isLoggedIn");
  studMail = prefs.getString("studMail");
  studPhone = prefs.getInt("studPhone");
  print("getStudentDetails visited..................");
}

checkLoginValue () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  checkValue = prefs.getBool("isLoggedIn");
  print("Main page check value..................");
  print(checkValue);
}
