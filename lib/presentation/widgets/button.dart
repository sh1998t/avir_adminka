import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.gradient,
    this.isBordered,
    this.textColor,
    this.border,
    this.height,
    this.isLoading,
    this.theme,
    this.width,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final LinearGradient? gradient;
  final bool? isBordered;
  final double? border;
  final double? height;
  final bool? isLoading;
  final TextStyle? theme;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
