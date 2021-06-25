
import 'package:flutter/material.dart';

import 'GlobalVariables.dart';

class BtnButton extends StatefulWidget {

  const BtnButton({
    Key key,
    @required this.titleText,
    @required this.colorUsed,
    @required this.noIcon,
    @required this.popup,
    this.iconUsed,
    this.routePath,
    this.refreshedState,
    this.index,
    this.qty,
  }) : super(key: key);

  final String titleText;
  final IconData iconUsed;
  final Color colorUsed;
  final String routePath;
  final String refreshedState;
  final bool noIcon;
  final bool popup;
  final int index;
  final int qty;

  @override
  _BtnButtonState createState() => _BtnButtonState();
}

class _BtnButtonState extends State<BtnButton> {

  @override
  void initState() {
    isClicked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: widget.colorUsed,
        child:Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.titleText,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: MediaQuery.of(context).size.height*0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              widget.noIcon == false ? SizedBox(width: MediaQuery.of(context).size.width*0.02,) : SizedBox.shrink(),
              widget.noIcon == false ? Icon(
                widget.iconUsed,
                color: Colors.white,
                size: MediaQuery.of(context).size.shortestSide*0.05,
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

}
