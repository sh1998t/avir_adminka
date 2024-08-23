import 'package:flutter/cupertino.dart';

class AppShadow {
  static final List<BoxShadow> main = [
    BoxShadow(
        offset: Offset(5.71, 5.71),
        blurRadius: 11.41,
        spreadRadius: 0,
        color: Color(0xFFA6ABBD).withOpacity(0.3)),
    BoxShadow(
        offset: Offset(-5.71, -5.71),
        blurRadius: 11.41,
        spreadRadius: 0,
        color: Color(0xFFFAFBFF).withOpacity(0.3)),
  ];
}
