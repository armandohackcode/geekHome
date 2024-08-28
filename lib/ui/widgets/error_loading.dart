import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  const ErrorLoading(
      {super.key, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(child: Text(message)),
        Center(
          child: ElevatedButton.icon(
            onPressed: onPressed,
            label: const Text("Retry"),
            icon: const Icon(Icons.refresh),
          ),
        )
      ],
    );
  }
}
