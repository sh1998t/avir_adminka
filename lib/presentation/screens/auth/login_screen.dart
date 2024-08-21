import 'package:avir_app/presentation/widgets/button.dart';
import 'package:avir_app/presentation/widgets/textfield_widget.dart';
import 'package:avir_app/presentation/widgets/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../admin_screen/admin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: TitleWidget(),
                ),
                const SizedBox(
                  height: 100,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      width: 520,
                      height: 346,
                      margin: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: const Color(0xFFFFFFFF).withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Image.asset('assets/images/migratsiya.png'),
                    Positioned(
                      top: 200,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          MainTextField(
                            width: 464,
                            height: 82,
                            title: "login".tr(),
                            hintText: "Login",
                          ),
                          MainTextField(
                            width: 464,
                            height: 82,
                            hintText: "password",
                            title: "password".tr(),
                          ),
                          MyButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => AdminScreen()));
                            },
                            text: 'enter'.tr(),
                            width: 464,
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
