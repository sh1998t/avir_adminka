import 'package:flutter/cupertino.dart';

class AppShadow {
  static final List<BoxShadow> main = [
    BoxShadow(
        offset: const Offset(5.71, 5.71),
        blurRadius: 11.41,
        spreadRadius: 0,
        color: const Color(0xFFA6ABBD).withOpacity(0.3)),
    BoxShadow(
        offset: const Offset(-5.71, -5.71),
        blurRadius: 11.41,
        spreadRadius: 0,
        color: const Color(0xFFFAFBFF).withOpacity(0.3)),
  ];
}
