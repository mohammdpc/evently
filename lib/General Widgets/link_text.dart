import 'package:flutter/material.dart';
import '../util.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback action;
  const LinkText({super.key, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: mainColor,
          decoration: TextDecoration.underline,
          decorationColor: mainColor,
        ),
      ),
    );
  }
}
