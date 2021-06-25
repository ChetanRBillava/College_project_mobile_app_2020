import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  void initState() {
    isClicked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("College App"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              Card(
                color: Colors.purpleAccent,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Admission",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            Icon(Icons.arrow_right,color: Colors.white,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.purpleAccent,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Stationary",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            Icon(Icons.arrow_right,color: Colors.white,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.purpleAccent,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hostel",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            Icon(Icons.arrow_right,color: Colors.white,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
