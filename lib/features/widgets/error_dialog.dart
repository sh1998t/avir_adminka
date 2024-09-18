import 'package:avir_app/features/auth/data/model/error_model.dart';
import 'package:avir_app/features/widgets/button.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final ErrorModel error;

  const ErrorDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Something went wrong"),
      content: Text(
        error.message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        MyButton(
          text: 'Ok',
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
