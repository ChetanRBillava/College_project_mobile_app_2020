import 'package:flutter/material.dart';
import 'dart:async';


class ContainerTest extends StatefulWidget {
  @override
  _ContainerTestState createState() => _ContainerTestState();
}



class _ContainerTestState extends State<ContainerTest> {
  bool tear = false;
  @override
  void initState() {

    Timer(Duration(seconds: 5), () {
      setState(() {
        tear = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.tealAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
                child: CustomPaint(
                  painter: CurvePainter(top: false),
                ),
              ),
              SizedBox(height: 40,),
              tear ? SizedBox(height: 40,) : SizedBox.shrink(),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
                child: CustomPaint(
                  painter: CurvePainter(top: true),
                ),
              ),
            ],
          ),
        )
    );
  }
}



class CurvePainter extends CustomPainter {

  CurvePainter({
    Key key,
    @required this.top,
  });
  final bool top;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.tealAccent;
    paint.style = PaintingStyle.fill;

    print('Index: '+top.toString());
    var path = Path();
    double xpos = 0.0;
    int hght = 0;
    print('XPOS');

    if(top){
      path.moveTo(0, 0);
      path.lineTo(size.width*0.05, 0);
      path.lineTo(size.width*0.1, -size.height*0.125);
      path.lineTo(size.width*0.15, 0);
      /*for(xpos = 0.0; xpos <=1.1 ; xpos += 0.05){
        print(xpos);
        hght = (hght+=1)%2;
        print('hght: '+ hght.toString());
        if(hght == 0){
          path.lineTo(size.width*xpos, 0);
        }
        else{
          path.lineTo(size.width*xpos, size.height*0.125);
        }
      }*/
    }

    else{
      path.moveTo(0, size.height);
      for(xpos = 0.0; xpos <=1.1 ; xpos += 0.05){
        print(xpos);
        hght = (hght+=1)%2;
        print('hght: '+ hght.toString());
        if(hght == 0){
          path.lineTo(size.width*xpos, size.height);
        }
        else{
          path.lineTo(size.width*xpos, size.height*0.875);
        }
      }
    }
    /*path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875, size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584, size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);*/

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}