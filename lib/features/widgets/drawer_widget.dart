import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DarverWidget extends StatelessWidget {
  const DarverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: AppColors.drawerColors,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('assets/images/migratsiya.png'),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 180,
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(5)),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  // MaterialPageRoute(
                  //   builder: (context) => ReportScreen(),
                  // ));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.event_repeat_outlined,
                      size: 20,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Report Screen",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
