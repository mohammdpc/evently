import 'package:flutter/material.dart';
class FilledTextButton extends StatelessWidget {
  final VoidCallback action;
  final String text;
  const FilledTextButton({super.key,required this.action, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: ()=>action,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.labelLarge,
        ),
      ),
    );
  }
}
