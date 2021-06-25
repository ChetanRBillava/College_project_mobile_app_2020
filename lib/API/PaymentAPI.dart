import 'dart:convert';
import 'dart:math';

import 'package:mitk_final_year_project_2020/UI/Purchases.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class PaymentAPI extends StatefulWidget {
  @override
  _PaymentAPIState createState() => _PaymentAPIState();
}

class _PaymentAPIState extends State<PaymentAPI> {

  @override
  void initState() {
    setState(() {
      pay();
    });
    // loading = true;
    super.initState();
  }

  Future<String> pay() async {
    transDate = (DateTime.now()).toString().substring(0,19);
    Random random = new Random();
    transOTP = (random.nextInt(1000000)).toString();

    print('Entered pay page................');


    print(studMail);
    print(paymentFor);
    print(transDetails);
    print(transType);
    print(transAmount);
    print(transDate);
    print(transOTP);
    var url = domainURL+"all_payment.php";

    var response = await http.post(url, body: {
      "email": studMail,
      "payment_for": paymentFor,
      "trans_detail": transDetails,
      "trans_type": transType,
      "total_amt": transAmount,
      "trans_date": transDate,
      "trans_otp": transOTP
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body);
    Fluttertoast.showToast(msg: body["message"]);
    viewPayment();
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
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Purchases()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.blue,
            size: 100,
          ),
        ),
      ),
    );
  }
}
