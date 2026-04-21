import 'package:flutter/material.dart';
import 'package:evently/util.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String body;
  const OnboardingText({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: screenHeight(context) * 0.019704433,
      children: [
        Text(title, style: Theme.of(context).primaryTextTheme.bodyLarge),
        Expanded(child: Text(body, style: Theme.of(context).primaryTextTheme.bodySmall)),
      ],
    );
  }
}