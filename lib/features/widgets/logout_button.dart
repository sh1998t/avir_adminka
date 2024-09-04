import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
            color: Theme.of(context).cardColor,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: SizedBox(
          height: 62,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "test111",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  Text(
                    "выход",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
