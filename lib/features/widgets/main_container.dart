import 'package:avir_app/core/utils/shadows/shadows.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final Widget child;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const MainContainer(
      {super.key,
      this.boxShadow,
      this.width,
      this.height,
      required this.child,
      this.borderRadius, this.padding,  this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: boxShadow ?? AppShadow.main,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: child,
    );
  }
}
