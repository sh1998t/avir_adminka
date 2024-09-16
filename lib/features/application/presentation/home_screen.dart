import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/features/application/presentation/widgets/application_button.dart';
import 'package:avir_app/features/application/presentation/widgets/application_widget.dart';
import 'package:avir_app/features/history/history_widget.dart';
import 'package:avir_app/features/widgets/main_appbar.dart';
import 'package:avir_app/features/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home-screen';
  static const String path = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;
  List<Widget> widgets = [
    Container(),
    const HistoryWidget(),
    const ApplicationWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Row(
      children: [
        MainContainer(
          padding: const EdgeInsets.all(32),
          width: 335,
          height: size.height,
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
                  svgUrl: 'svg/play.svg',
                  title: 'active',
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  isActive: index == 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  svgUrl: 'svg/time.svg',
                  title: 'history',
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  isActive: index == 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  svgUrl: 'svg/add-outline.svg',
                  title: 'history',
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  isActive: index == 2,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 335,
          child: Column(
            children: [const MainNavbar(), widgets[index]],
          ),
        )
      ],
    ));
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
