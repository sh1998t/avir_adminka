import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class MainOutlineButton extends StatelessWidget {
  final bool? isActive;
  final String title;
  final VoidCallback onPressed;

  const MainOutlineButton({
    super.key,
    required this.isActive,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 251,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE0E0E0))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: const Offset(0, 0)),
                    ]),
                width: 20,
                height: 20,
                child: Visibility(
                  visible: isActive != null,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      (isActive ?? false) ? AppColors.green : Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}