import 'package:flutter/material.dart';
import '../util.dart';

import '../Providers/settings_provider.dart';

class InputField extends StatefulWidget {
  bool obscure;
  final bool expand;
  final String? iconPath;
  final String hintText;
   Widget? suffix;
  final Function(String?) validator;
  final TextEditingController controller;
  InputField({
    super.key,
     this.iconPath,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.suffix,
    this.obscure = false,
    this.expand = false

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
      controller: widget.controller,
      onChanged: (v)=>widget.controller.text = v,
      expands: widget.expand,
      maxLines: widget.expand?null:1,
      textAlignVertical: TextAlignVertical.top,
      style: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(color: mainText),
      decoration: InputDecoration(
        prefixIcon:widget.iconPath != null? Padding(
          padding: EdgeInsets.only(left: setting.language?widthOf(16, context):0,right: !setting.language?widthOf(16, context):0),
          child: Image.asset(
            widget.iconPath!,
            width: widthOf(24, context),
            height: heightOf(24, context),
          ),
        ):null,
        prefixIconConstraints: prefixConstraints,
        contentPadding: EdgeInsets.all(16),
        hintText: widget.hintText,
        //suffix: widget.suffix,
        suffixIcon: widget.suffix,
      ),
      obscureText: widget.obscure,
      validator: (v) => widget.validator(v),
    );
  }
}
