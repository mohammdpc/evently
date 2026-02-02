import 'package:flutter/material.dart';
import '../util.dart';

import '../Providers/settings_provider.dart';

class InputField extends StatefulWidget {
  bool obscure;
  final String iconPath;
  final String hintText;
  final Widget? suffix;
  final Function(String?) validator;
  InputField({
    super.key,
    required this.iconPath,
    required this.hintText,
    required this.validator,
    this.suffix,
    this.obscure = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    BoxConstraints prefixConstraints = BoxConstraints(
      maxWidth: widthOf(24 + 16, context),
      maxHeight: heightOf(24, context),
    );

    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: setting.language?widthOf(16, context):0,right: !setting.language?widthOf(16, context):0),
          child: Image.asset(
            widget.iconPath,
            width: widthOf(24, context),
            height: heightOf(24, context),
          ),
        ),
        prefixIconConstraints: prefixConstraints,
        contentPadding: EdgeInsets.all(16),
        hintText: widget.hintText,
        suffix: widget.suffix,
      ),
      obscureText: widget.obscure,
      validator: (v) => widget.validator(v),
    );
  }
}
