
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

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
          title: Row(
            children: [
              Text(
                  widget.title,
              ),
            ],
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        drawer: SideNavBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Stack(
                children: [
                  Center(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:stationary.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int i) {
                        /*if(i == 0){
                          return Column(
                            children: [
                              Row(
                                children: [
                                  HeadingText(titleText: 'Cart', colorUsed: Colors.blue,),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Stationary(index: i),
                            ],
                          );
                        }
                        if(i == 2){
                          return Column(
                            children: [
                              Stationary(index: i),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1),
                            ],
                          );
                        }*/
                        return Stationary(index: i);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}



class Stationary extends StatefulWidget {

  Stationary({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  _StationaryState createState() => _StationaryState();
}

class _StationaryState extends State<Stationary> {

  final myQuantityController = TextEditingController();
  bool qtyChanged=false;
  var cartQTY, cartItem;

  var now = DateTime.now();
  var formatter = DateFormat();
  String formattedDate;

  @override
  void initState() {
    myQuantityController.text = '1';
    super.initState();
  }

  Future<String> addCart() async {
    print('Entered addCart page................');
    String url = domainURL+'add_cart.php';

    var response = await http.post(url, body: {
      "itemid": cartItem,
      "email": studMail,
      "status": '0',
      "quantity": cartQTY,
      "createdDatetime": formattedDate,
      "updatedDatetime": formattedDate,
    });
    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    Fluttertoast.showToast(msg: body["message"]);
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.015),
        Card(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
          shadowColor: Colors.black,
          elevation: MediaQuery.of(context).size.height*0.022,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          height:  MediaQuery.of(context).size.height*0.2,
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/logo.png',
                              image: 'https://www.pngitem.com/pimgs/m/194-1948806_school-notebooks-png-transparent-png.png',
                              height:  MediaQuery.of(context).size.height*0.18,
                              fit: BoxFit.fill
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                    Container(
                      height:  MediaQuery.of(context).size.height*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: '+stationary[widget.index]["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                            ),
                          ),
                          Text(
                            'Price: '+stationary[widget.index]["amount"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.shortestSide*0.04
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text(
                              'Subtotal: Rs.'+(int.parse(stationary[widget.index]["amount"])*int.parse(myQuantityController.text)).toString()+
                                  ' for '+myQuantityController.text+' units',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //BodyText(titleText: 'Quantity:  ', textSize: 0.04, colorUsed: Colors.black),
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (){
                          if(int.parse(myQuantityController.text) <= 1){
                            Fluttertoast.showToast(msg: '1 is the minimum count');
                          }
                          else{
                            //myQuantityController.text = (int.parse(myQuantityController.text) - 1).toString() ;
                            setState(() {
                              myQuantityController.text = (int.parse(myQuantityController.text) - 1).toString() ;
                              print(myQuantityController.text);
                              //total = int.parse(myQuantityController.text) * subtotal;
                            });
                          }
                        }
                    ),
                    Container(
                      //padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      width: MediaQuery.of(context).size.width*0.15,
                      height: MediaQuery.of(context).size.width*0.08,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: myQuantityController,
                        maxLines: 1,
                        onEditingComplete: (){
                          setState(() {
                            if(myQuantityController.text == ''){
                              print('null quantity');
                              myQuantityController.text = 1.toString();
                              print('new quantity: '+myQuantityController.text);
                            }
                          });
                        },
                        onChanged: (value){
                          print(value);
                          if(myQuantityController.text == ''){
                            print('null quantity');
                            setState(() {
                              myQuantityController.text = 1.toString();
                            });
                            print('new quantity: '+myQuantityController.text);
                          }
                          if(myQuantityController.text != ''){
                            setState(() {
                              //total = int.parse(myQuantityController.text) * subtotal;
                            });
                          }
                        },
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: (){
                          //myQuantityController.text = (int.parse(myQuantityController.text) + 1).toString() ;
                          setState(() {
                            myQuantityController.text = (int.parse(myQuantityController.text) + 1).toString() ;
                            print(myQuantityController.text);
                            //total = int.parse(myQuantityController.text) * subtotal;
                          });
                        }
                    ),
                    GestureDetector(
                      onTap: (){
                        print('........................................');
                        cartQTY = myQuantityController.text;
                        print(cartQTY);
                        cartItem = stationary[widget.index]["item_id"];
                        print(cartItem);
                        formattedDate = DateFormat('d-M-y').format(now);
                        print(formattedDate);
                        addCart();
                      },
                      child: Container(
                        color: Colors.green,
                        //width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,)
                  ],
                )
              ],
            )
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.015),
      ],
    );
  }


}
