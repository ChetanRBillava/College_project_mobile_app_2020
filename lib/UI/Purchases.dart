import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/material.dart';

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
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
                    Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      child: Stack(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: purchases.length,
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  PurchasesTile(index: i),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                                ],
                              );
                            },),
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



class PurchasesTile extends StatefulWidget {
  PurchasesTile({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  _PurchasesTileState createState() => _PurchasesTileState();
}

class _PurchasesTileState extends State<PurchasesTile> {
Color bkg;
  @override
  void initState() {
    if(purchases[widget.index]["payment_for"].toString() == 'Stationary items'){
      setState(() {
        bkg = Colors.amber;
      });
    }
    else if(purchases[widget.index]["payment_for"].toString() == 'Admission fee'){
      setState(() {
        bkg = Colors.blue;
      });
    }
    else if(purchases[widget.index]["payment_for"].toString() == 'Mess bill'){
      setState(() {
        bkg = Colors.green;
      });
    }
    else if(purchases[widget.index]["payment_for"].toString() == 'Room rent'){
      setState(() {
        bkg = Colors.redAccent;
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width*0.94,
            color: bkg,
            child: Column(
              children: [
                Row(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Purchase ID: '+purchases[widget.index]["orderid"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Payment for: '+purchases[widget.index]["payment_for"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Transaction details: '+purchases[widget.index]["trans_detail"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Transaction type: '+purchases[widget.index]["trans_type"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Transaction date: '+purchases[widget.index]["trans_date"].substring(0,10),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Total amount: '+purchases[widget.index]["total_amt"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'Status: '+purchases[widget.index]["trans_status"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                purchases[widget.index]["payment_for"] == 'Stationary items'?
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(
                          'OTP: '+purchases[widget.index]["otp"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.shortestSide*0.04
                          ),
                        ),
                      ),
                    ),
                  ],
                ): SizedBox.shrink(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
