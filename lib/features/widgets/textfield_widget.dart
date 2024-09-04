import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.prefix,
    this.inputFormatters,
    this.hintText,
    this.style,
    this.width,
    this.height,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.controller,
    this.onchange,
    this.contentPadding,
    this.validator,
    this.title, this.textCapitalization,
  });

  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextStyle? style;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final TextEditingController? controller;
  final ValueChanged? onchange;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final String? title;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty ?? false,
          child: Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            onChanged: onchange,
            validator: validator,
            style: TextStyle(color: Colors.black),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              prefix: const SizedBox(),
              prefixIcon: prefix,
              fillColor: AppColors.textFieldBack,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: AppColors.hintText, fontWeight: FontWeight.w500),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.white, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
