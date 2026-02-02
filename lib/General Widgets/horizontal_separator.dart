import 'package:flutter/material.dart';
import '../util.dart';
class HorizontalSpacer extends StatelessWidget {
  final double h;
  const HorizontalSpacer({super.key,required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: heightOf(h, context),);
  }
}