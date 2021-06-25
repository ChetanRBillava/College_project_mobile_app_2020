import 'package:mitk_final_year_project_2020/Widgets/GlobalVariables.dart';
import 'package:mitk_final_year_project_2020/Widgets/SideNavBar.dart';
import 'package:mitk_final_year_project_2020/Widgets/Texts.dart';
import 'package:flutter/material.dart';

class ViewLeave extends StatefulWidget {
  @override
  _ViewLeaveState createState() => _ViewLeaveState();
}

class _ViewLeaveState extends State<ViewLeave> {
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
                    Row(
                      children: [
                        HeadingText(titleText: 'View Leaves', colorUsed: Colors.black),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      child: Stack(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: leaves.length,
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  LeaveTile(index: i),
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

class LeaveTile extends StatefulWidget {
  LeaveTile({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  _LeaveTileState createState() => _LeaveTileState();
}

class _LeaveTileState extends State<LeaveTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width*0.84,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Applied on: '+leaves[widget.index]["applied_on"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Leave type: '+leaves[widget.index]["leave_type"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Leave till: '+leaves[widget.index]["leave_till"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Return date: '+leaves[widget.index]["return_date"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Reason: '+leaves[widget.index]["reason"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(titleText: 'Leave Status: '+leaves[widget.index]["leave_status"], textSize: 0.04, colorUsed: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
