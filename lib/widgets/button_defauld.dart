import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';

class ButtonDefault extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;

  const ButtonDefault(
      {Key key, @required this.buttonText, @required this.buttonTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.SPACE_10))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            Dimens.SPACE_30, Dimens.SPACE_15, Dimens.SPACE_30, Dimens.SPACE_15),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: CustomColors.whiteColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
