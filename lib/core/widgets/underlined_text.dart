import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final void Function() callback;
  const UnderlinedText({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.lightBlue,
          fontStyle: FontStyle.italic,
          color: ColorsManager.lightBlue
        ),
      ),
    );
  }
}
