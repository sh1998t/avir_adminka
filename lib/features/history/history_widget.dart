import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 76,child: Text("active_requests".tr(), style: Theme.of(context).textTheme.headlineSmall,),),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
            return Container();
          }),
        ),
      ],
    );
  }
}
