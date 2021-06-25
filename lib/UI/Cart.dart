import 'dart:convert';
import 'dart:math';

import 'package:mitk_final_year_project_2020/API/PaymentAPI.dart';
import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

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
                    'Cart',
                  ),
                ],
              ),
              backgroundColor: Colors.purpleAccent,
            ),
            drawer: SideNavBar(),
            bottomNavigationBar:  cart.length > 0 ?
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.07,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          transDetails = '';
                          paymentFor = 'Stationary items';
                          transType = 'offline';
                          transAmount = 'Rs.'+total.toString();
                          for (int i =0; i< cart.length ; i++){
                            transDetails += cart[i]["item_name"]+', ';
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentAPI()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Pay later',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.064
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.07,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          transDetails = '';
                          paymentFor = 'Stationary items';
                          transType = 'online';
                          transAmount = 'Rs.'+total.toString();
                          for (int i =0; i< cart.length ; i++){
                            transDetails += cart[i]["item_name"]+', ';
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentAPI()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Pay now',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.shortestSide*0.064
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ) : SizedBox.shrink(),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height*0.07 -kToolbarHeight*1.4,
                  child: Stack(
                    children: [
                      cart.length > 0 ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:cart.length,
                        shrinkWrap: false,
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
                          return Column(
                            children: [
                              CartItems(index: i),

                            ],
                          );
                        },
                      ) :
                      Center(
                        child: Text(
                          'Cart is empty',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.shortestSide*0.07,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}


class CartItems extends StatefulWidget {

  CartItems({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  final myQuantityController = TextEditingController();
  bool qtyChanged=false;
  var cartQTY, cartItem;

  var now = DateTime.now();
  var formatter = DateFormat();
  String formattedDate;

  @override
  void initState() {
    myQuantityController.text = cart[widget.index]["quantity"];
    super.initState();
  }


  Future<String> test() async{
    print("Entered test...........");

    var url = domainURL+"update_cart.php";
    var response = await http.post(url, body: {
      "cartID": cartItem,
      "qty": cartQTY,
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body["message"]);
    if(body["code"] == 200){
      Fluttertoast.showToast(msg: body["message"]);
      viewCart();
    }
    else{
      Fluttertoast.showToast(msg: body["message"]);
    }

  }

  Future<String> updateCart() async {
    print('Entered updateCart page................');
    var url = domainURL+"update_cart.php";
    var response = await http.post(url, body: {
      "cartID": cartItem,
      "qty": cartQTY,
    });

    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body["message"]);
    if(body["code"] == 200){
      Fluttertoast.showToast(msg: body["message"]);
      viewCart();
    }
    else{
      Fluttertoast.showToast(msg: body["message"]);
    }
  }

  Future<String> deleteCart() async {
    print('Entered deleteCart page................');
    print(cartItem);
    String url = domainURL+'delete_cart.php';
    var response = await http.post(url, body: {
      "cartID": cartItem
    });
    print('Status code: '+response.statusCode.toString());
    var body = jsonDecode(response.body);
    print(body["message"]);
    if(body["code"] == 200){
      Fluttertoast.showToast(msg: body["message"]);
      viewCart();
    }
    else{
      Fluttertoast.showToast(msg: body["message"]);
    }
  }

  Future<String> viewCart() async {
    print('Entered viewCart page................');
    cart.clear();
    total = 0;
    //String studMail = "sadhviah@gmail.com";
    String url = domainURL+'view_cart.php?email=$studMail';

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
        cart.add(dataredecode[i]);
        total += int.parse(dataredecode[i]["quantity"]) * int.parse(dataredecode[i]["item_amount"]);
      }
    }
    print('Cart length: '+cart.length.toString());
    print('Rs.'+total.toString());
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cart()),
    );
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
                              'Name: '+cart[widget.index]["item_name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                            Text(
                              'Price: '+cart[widget.index]["item_amount"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.shortestSide*0.04
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Text(
                                'Subtotal: Rs.'+(int.parse(cart[widget.index]["item_amount"])*int.parse(myQuantityController.text)).toString()+
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                print('........................................');
                                cartItem = cart[widget.index]["cart_id"];
                                print(cartItem);
                                deleteCart();
                              },
                              child: Container(
                                color: Colors.red,
                                //width: MediaQuery.of(context).size.width*0.4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              cartItem = cart[widget.index]["cart_id"];
                              print(cartItem);
                              cartQTY = myQuantityController.text;
                              print(cartQTY);
                              updateCart();
                            },
                            child: Container(
                              color: Colors.blue,
                              //width: MediaQuery.of(context).size.width*0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.02,)
                        ],
                      ),
                    ],
                  ),
                 /* CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: MyPainter(),
                  ),*/
                ],
              )
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.015),
      ],
    );

  }


}


class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;

    paintZigZag(canvas, paint, Offset(0, 0), Offset(size.width*0.6, 0), 200, 5);
  }

  void paintZigZag(Canvas canvas, Paint paint, Offset start, Offset end, int zigs, double width) {
    assert(zigs.isFinite);
    assert(zigs > 0);
    canvas.save();
    canvas.translate(start.dx, start.dy);
    end = end - start;
    canvas.rotate(math.atan2(end.dy, end.dx));
    final double length = end.distance;
    final double spacing = length / (zigs * 2.0);
    final Path path = Path()..moveTo(0.0, 0.0);
    for (int index = 0; index < zigs; index += 1) {
      final double x = (index * 2.0 + 1.0) * spacing;
      final double y = width * ((index % 2.0) * 2.0 - 1.0);
      path.lineTo(x, y);
    }
    path.lineTo(length, 0.0);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
