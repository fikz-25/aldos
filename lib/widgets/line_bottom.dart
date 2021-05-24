import 'package:aldo/resources/colors.dart';
import 'package:flutter/material.dart';

class LineBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 6,
      width: 150,
      decoration: BoxDecoration(
        color: CustomColors.lineColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
