import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/presentation/screens/admin_screen/widgets/application_button.dart';

import 'package:avir_app/presentation/widgets/language_widget.dart';
import 'package:avir_app/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/phone_number_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        MainContainer(
          padding: EdgeInsets.all(32),
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
                SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  svgUrl: 'svg/play.svg',
                  title: 'active',
                  onPressed: () {},
                  isActive: false,
                ),
                SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  svgUrl: 'svg/time.svg',
                  title: 'history',
                  onPressed: () {},
                  isActive: false,
                ),
                SizedBox(
                  height: 10,
                ),
                ApplicationButtonWidget(
                  svgUrl: 'svg/add-outline.svg',
                  title: 'history',
                  onPressed: () {},
                  isActive: true,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainNavbar(),
              StepsWidget(),
              SizedBox(height: 22,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(children: [
                  Text('select_type_application'.tr(), style: Theme.of(context).textTheme.bodyMedium,)
                ],),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 22,
      ),
      decoration: BoxDecoration(
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
          SizedBox(
            height: 12,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
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
                  SizedBox(width: 10,),
                  SvgPicture.asset('assets/svg/arror_farword.svg'),
                  SizedBox(width: 10,),
                  StepWidget(
                    isActive: false,
                    title: '${'step'.tr()} 1',
                    onPressed: () {},
                    subtitle: 'step_subtitle'.tr(),
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset('assets/svg/arror_farword.svg'),
                  SizedBox(width: 10,),
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
        padding: EdgeInsets.all(12),
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
            SizedBox(
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

class MainNavbar extends StatelessWidget {
  const MainNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PhoneNumberWidget(),
          SizedBox(
            width: 20,
          ),
          LanguageWidget(),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: SvgPicture.asset('assets/svg/profile.svg'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "profile:ID",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                )),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'exit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ).tr(),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/svg/Logout.svg')
                  ],
                )),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

// Importing all the screens
