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
