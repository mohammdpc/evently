import 'package:flutter/material.dart';

import 'package:evently/util.dart';

class TabCard extends StatelessWidget {
  final bool selected;
  final int index;
  final String icon;
  final String text;
  final VoidCallback action;
  const TabCard({
    super.key,
    required this.index,
    required this.selected,
    required this.icon,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
          color: selected ? mainColor : input,
          border: selected ? null : BoxBorder.all(color: stroke),
        ),
        padding: EdgeInsets.symmetric(
          vertical: heightOf(8, context),
          horizontal: widthOf(16, context),
        ),
        child: Row(
          spacing: widthOf(8, context),
          children: [
            Image.asset(
              icon,
              width: widthOf(24, context),
              color: selected ? Colors.white : mainColor,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: selected ? Colors.white : mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}