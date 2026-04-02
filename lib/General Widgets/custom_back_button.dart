import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import '../Providers/settings_provider.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback action;
  const CustomBackButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.085333333,
      height: screenWidth(context) * 0.085333333,
      child: FilledButton(
        style: Theme.of(context).filledButtonTheme.style!.copyWith(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: screenWidth(context) * 0.029333333,
              vertical: screenHeight(context) * 0.009852217,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(input),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(
                Radius.circular(8),
              ),
              side: BorderSide(color: stroke),
            ),
          ),
        ),
        onPressed: action,
        child: Icon(
          Icons.arrow_back_ios,
          color: setting.theme ? mainColor : lightInput,
          weight: screenWidth(context) * 0.018933333,
        ),
      ),
    );
  }
}
