import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';

class CustomDecoration {
  static BoxDecoration createBox() {
    return BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.ROUNDED_CORNER),
            topRight: Radius.circular(Dimens.ROUNDED_CORNER)));
  }

  static BoxDecoration createCardView() {
    return BoxDecoration(
      color: CustomColors.whiteColor,
      borderRadius: BorderRadius.circular(Dimens.ROUNDED_CARDVIEW),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20.0, // has the effect of softening the shadow
          spreadRadius: 2.0, // has the effect of extending the shadow
          offset: Offset(
            10.0, // horizontal, move right 10
            10.0, // vertical, move down 10
          ),
        )
      ],
    );
  }
}
