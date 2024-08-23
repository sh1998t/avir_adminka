import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/core/utils/shadows/shadows.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: AppShadow.main,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LanguageButton(
            title: 'ru',
            onPressed: () {
              context.setLocale(Locale('ru'));
            setState(() {

            });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          LanguageButton(
            title: 'uz',
            onPressed: () {
              context.setLocale(Locale('uz'),);
              setState(() {

              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          LanguageButton(
            title: 'qr',
            onPressed: () {
              context.setLocale(Locale('qr'));
            },
          ),
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const LanguageButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: context.locale.languageCode == title
              ? AppColors.primary
              : AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
              color: context.locale.languageCode == title
                  ? AppColors.white
                  : AppColors.black),
        ),
      ),
    );
  }
}