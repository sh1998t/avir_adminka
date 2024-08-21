import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/presentation/widgets/show_dialog_widget.dart';
import 'package:avir_app/presentation/widgets/textfield_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserHighScreen extends StatelessWidget {
  final double? width;
  const UserHighScreen({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
        left: 30,
        top: 40,
      ),
      child: Container(
        height: 250,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("user".tr()),
                  Row(
                    children: [
                      ShowDialogWidget(
                        heigths: 350,
                        width: 150,
                        heigth: 40,
                        decoration: BoxDecoration(color: Colors.tealAccent),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: MainTextField(
                                title: 'hello',
                                height: 40,
                                width: 800,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: MainTextField(
                                title: 'hello',
                                height: 40,
                                width: 800,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: MainTextField(
                                title: 'hello',
                                height: 40,
                                width: 800,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: MainTextField(
                                title: 'hello',
                                height: 40,
                                width: 800,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
