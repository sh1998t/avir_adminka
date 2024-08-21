import 'package:flutter/material.dart';

class ShowDialogWidget extends StatelessWidget {
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final EdgeInsets? insetPadding;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final double? width;
  final double? heigth;
  final double? heigths;
  final Decoration? decoration;
  const ShowDialogWidget({
    super.key,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetPadding,
    this.shape,
    this.alignment,
    this.width,
    this.heigth,
    this.heigths,
    this.decoration,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      decoration: decoration,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: heigths,
                  child: child,
                ),
                backgroundColor: backgroundColor,
                elevation: elevation,
                shadowColor: shadowColor,
                surfaceTintColor: surfaceTintColor,
                shape: shape,
                alignment: alignment,
                insetPadding: insetPadding,
              );
            },
          );
        },
      ),
    );
  }
}
