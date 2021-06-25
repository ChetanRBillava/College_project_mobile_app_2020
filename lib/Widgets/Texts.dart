import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {


  const HeadingText({
    Key key,
    @required this.titleText,
    @required this.colorUsed,
  }) : super(key: key);

  final String titleText;
  final Color colorUsed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.shortestSide*0.024),
        child: Text(
          titleText,
          style: TextStyle(
            fontFamily: 'Poppins',
              color: colorUsed,
              fontSize: MediaQuery.of(context).size.shortestSide*0.06,
              fontWeight: FontWeight.bold,
              //letterSpacing:  MediaQuery.of(context).size.width*0.01,
              //wordSpacing: MediaQuery.of(context).size.width*0.02
          ),
        ),
      ),
    );
  }
}


class GradientHeadingText extends StatelessWidget {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff19d3da),
      Color(0xff00587a),
      Color(0xff120078)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 400, 400));


  GradientHeadingText({
    Key key,
    @required this.titleText,
  }) : super(key: key);

  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.shortestSide*0.024),
      child: Text(
        titleText,
        style: TextStyle(
            fontFamily: 'Poppins',
            foreground: Paint()..shader = linearGradient,
            fontSize: MediaQuery.of(context).size.height*0.025,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}


class BodyText extends StatelessWidget {


  const BodyText({
    Key key,
    @required this.titleText,
    @required this.textSize,
    @required this.colorUsed,
    this.strike,
    this.dots,
  }) : super(key: key);


  final String titleText;
  final double textSize;
  final Color colorUsed;
  final bool strike;
  final bool dots;

  @override
  Widget build(BuildContext context) {
    TextDecoration deco;
    TextOverflow dotted;
    if(strike == true){
      deco = TextDecoration.lineThrough;
    }
    else{
      deco = TextDecoration.none;
    }
    if(dots == true){
      dotted = TextOverflow.ellipsis;
    }
    else{
      dotted = TextOverflow.visible;
    }
    return Container(
      child: Text(
        titleText,
        overflow: dotted,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.shortestSide*textSize,
          color: colorUsed,
          decoration: deco,
        ),

      ),
    );
  }


}


class GradientBodyText extends StatelessWidget {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff19d3da),
      Color(0xff00587a),
      Color(0xff120078)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 400, 400));

  GradientBodyText({
    Key key,
    @required this.titleText,
    @required this.textSize,
  }) : super(key: key);

  final String titleText;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textWidthBasis: TextWidthBasis.parent,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        foreground: Paint()..shader = linearGradient,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.shortestSide*textSize,
      ),
    );
  }
}

class NotificationText extends StatelessWidget {

  const NotificationText({
    Key key,
    @required this.titleText,
    @required this.textSize,
    @required this.textLines,
    @required this.colorUsed,
  }) : super(key: key);

  final String titleText;
  final double textSize;
  final int textLines;
  final Color colorUsed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.start,
          maxLines: textLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.shortestSide*textSize,
            color: colorUsed,
          ),
        ),
      ],
    );
  }
}
