import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/core/utils/shadows/shadows.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationButtonWidget extends StatelessWidget {
  final String svgUrl;
  final VoidCallback onPressed;
  final String title;
  final bool isActive;

  const ApplicationButtonWidget({
    super.key,
    required this.svgUrl,
    required this.onPressed,
    required this.title, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 72 : 48 ,
      width: 251,
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
          boxShadow: AppShadow.main,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border(left: BorderSide(color: isActive ? AppColors.green: Colors.white, width: 4))
      ),
      duration: Duration(milliseconds: 500),
      child: Row(
        children: [
          SvgPicture.asset(svgUrl),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr()
        ],
      ),
    );
  }
}