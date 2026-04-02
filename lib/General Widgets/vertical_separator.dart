import 'package:flutter/material.dart';
import '../util.dart';
class VerticalSpacer extends StatelessWidget {
  final double h;
  const VerticalSpacer({super.key,required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: heightOf(h, context),);
  }
}