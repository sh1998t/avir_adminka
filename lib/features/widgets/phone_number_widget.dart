

import 'package:flutter/material.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("+998 71 707 77 77", style: Theme.of(context).textTheme.bodyMedium,);
  }
}
