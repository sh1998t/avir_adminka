import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/features/application/presentation/widgets/application_button.dart';
import 'package:avir_app/features/widgets/main_appbar.dart';
import 'package:avir_app/features/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../application/presentation/widgets/application_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home-screen';
  static const String path = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _activeScreen = 'active';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        MainContainer(
          padding: const EdgeInsets.all(32),
          width: 335,
          child: MainContainer(
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'applications'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  onTap: () {},
                  svgUrl: 'svg/play.svg',
                  title: 'active',
                  onPressed: () {},
                  isActive: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  onTap: () {},
                  svgUrl: 'svg/time.svg',
                  title: 'history',
                  onPressed: () {},
                  isActive: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  onTap: () {},
                  svgUrl: 'svg/add-outline.svg',
                  title: 'history',
                  onPressed: () {},
                  isActive: true,
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainNavbar(),
                // ActiveScreen(),
                ApplicationWidget(),
                // SizedBox(width: 10),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

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

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    super.key,
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

class StepWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isActive;

  const StepWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isActive ? AppColors.secondary : AppColors.unselectedColor),
        height: 68,
        width: 196,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

// Importing all the screens
