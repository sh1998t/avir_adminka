import 'package:avir_app/core/DI/di_container.dart';
import 'package:avir_app/core/storage/app_preference.dart';
import 'package:avir_app/features/widgets/language_widget.dart';
import 'package:avir_app/features/widgets/phone_number_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          const PhoneNumberWidget(),
          const SizedBox(
            width: 20,
          ),
          const LanguageWidget(),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset('assets/svg/profile.svg'),
                    ),
                    const SizedBox(
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
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  inject<AppPreference>().deleteToken();
                },
                child: Row(
                  children: [
                    Text(
                      'exit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ).tr(),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/svg/Logout.svg')
                  ],
                )),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
