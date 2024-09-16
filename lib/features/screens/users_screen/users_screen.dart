import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/features/screens/users_screen/user_high_screen.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  final double width;
  const UsersScreen({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.containerColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserHighScreen(
              width: width,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              width: width,
              margin: EdgeInsets.only(right: 30, left: 30, top: 40, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
