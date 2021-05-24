import 'package:flutter/material.dart';

class CustomColors {
  static var primaryColor = hexToColor("#FF7643");
  static var secondaryBackgroundColor = hexToColor("#FFEBE2");
  static var whiteColor = hexToColor("#FFFFFF");
  static var black = hexToColor("#000000");
  static var formBackgroundColor = hexToColor("#ededed");
  static var primaryTextColor = hexToColor("#333333");
  static var secondaryTextColor = hexToColor("#828282");
  static var secondaryButtonColor = hexToColor("#FF9169");
  static var transparent = hexToColor("#00FFFFFF");
  static var lineColor = hexToColor("#E0E0E0");
  static var blueColor = hexToColor("#2D9CDB");
  static var otpLine = hexToColor("#BDBDBD");

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return new Color(int.parse(hexColor, radix: 16) + 0xFF000000);
  }
}
