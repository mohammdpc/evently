import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final Widget child;
  final Color fill;
  final Color borderColor;
  const InfoContainer({super.key,required this.child, required this.borderColor, required this.fill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: BoxBorder.all(
          color: borderColor,
        )
      ),
      child: child,
    );
  }
}