
import 'package:flutter/material.dart';
import 'package:mitk_final_year_project_2020/UI/Login.dart';

import 'GlobalVariables.dart';
import 'Texts.dart';

showAlertDialog(BuildContext context) {

// set up the buttons
  Widget cancelButton = FlatButton(
    child: BodyText(titleText: 'cancel', textSize: 0.04, colorUsed: Colors.white),
    onPressed:  () {
      isClicked = false;
      Navigator.pop(context);
    },
  );

  Widget continueButton = FlatButton(
    child: BodyText(titleText: 'continue', textSize: 0.04, colorUsed: Colors.white),
    onPressed:  () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    },
  );

// set up the AlertDialog
  AlertDialog alert = AlertDialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.04),
      ),
      title: HeadingText(titleText: 'Logout?', colorUsed: Colors.white),
      content: BodyText(titleText: 'Do you really want to logout?', textSize: 0.04, colorUsed: Colors.white),
      actions: [
        cancelButton,
        continueButton,
      ],
  );

// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
