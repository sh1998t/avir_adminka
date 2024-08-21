import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;
  const ButtonWidget({super.key, this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextButton(
              onPressed: onPressed,
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                  )
                ],
              )),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
