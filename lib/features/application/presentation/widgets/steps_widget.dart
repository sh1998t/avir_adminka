import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home_screen.dart';

class StepsWidget extends StatelessWidget {
  final int step;

  const StepsWidget({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 22,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF166DCC),
            Color(0xFF4C93E0),
          ],
        ),
      ),
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'create_service_title'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  StepWidget(
                    isActive: true,
                    title: '${'step'.tr()} 1',
                    onPressed: () {},
                    subtitle: 'step_subtitle'.tr(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/svg/arror_farword.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  StepWidget(
                    isActive: false,
                    title: '${'step'.tr()} 1',
                    onPressed: () {},
                    subtitle: 'step_subtitle'.tr(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/svg/arror_farword.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  StepWidget(
                    isActive: false,
                    title: '${'step'.tr()} 1',
                    onPressed: () {},
                    subtitle: 'step_subtitle'.tr(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}