import 'package:avir_app/core/utils/shadows/shadows.dart';
import 'package:avir_app/presentation/widgets/button.dart';
import 'package:avir_app/presentation/widgets/language_widget.dart';
import 'package:avir_app/presentation/widgets/phone_number_widget.dart';
import 'package:avir_app/presentation/widgets/textfield_widget.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 30,
        toolbarHeight: 70,
        flexibleSpace: Container(
          height: 70,
          decoration:
              BoxDecoration(boxShadow: AppShadow.main, color: Colors.white),
        ),
        actions: const [
          PhoneNumberWidget(),
          SizedBox(
            width: 10,
          ),
          LanguageWidget(),
          SizedBox(
            width: 135,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppShadow.main,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 530,
                  child: Text(
                    'login_title'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/migratsiya.png",
                      width: 78,
                      height: 80,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Image.asset(
                      "assets/images/iiv.png",
                      width: 78,
                      height: 80,
                    ),
                  ],
                ),
                MainTextField(
                  width: 464,
                  height: 58,
                  title: "login".tr(),
                  hintText: "login".tr(),
                ),
                SizedBox(
                  height: 16,
                ),
                MainTextField(
                  width: 464,
                  height: 58,
                  hintText: "password".tr(),
                  title: "password".tr(),
                ),

                SizedBox(height: 22,),
                MyButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AdminScreen()));
                  },
                  text: 'enter'.tr(),
                  textColor: Colors.white,
                  width: 464,
                  height: 58,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
