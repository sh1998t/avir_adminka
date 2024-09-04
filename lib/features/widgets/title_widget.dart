import 'package:avir_app/core/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
            color: AppColors.white.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(999)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/iiv.png",
              width: 70,
              height: 70,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'login_title',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black),
            ).tr(),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/images/iiv_icon.png',
              width: 70,
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
