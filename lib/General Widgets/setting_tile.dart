import 'package:flutter/material.dart';
import 'package:evently/util.dart';
class SettingTile extends StatelessWidget {
  final String text;
  final Widget action;
  const SettingTile({super.key,required this.text,required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: widthOf(16, context),vertical: heightOf(16, context)),
      decoration: BoxDecoration(
        color: input,
        border: BoxBorder.all(color: stroke),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: mainText),),
          action
        ],
      ),
    );
  }
}
