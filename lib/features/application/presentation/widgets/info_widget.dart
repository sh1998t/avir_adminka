import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.value,
  });

  final String title;
  final double? width;
  final double? height;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          height: height ?? 46,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.textFieldBack),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}


class InfoWidgetTwo extends StatelessWidget {
  const InfoWidgetTwo({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.value,
    required this.valueTwo,
    required this.valueThree,
  });

  final String title;
  final double? width;
  final double? height;
  final String value;
  final String valueTwo;
  final String valueThree;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width ?? 320,
          height: height ?? 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.textFieldBack),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                valueTwo,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                valueTwo,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}