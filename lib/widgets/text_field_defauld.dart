import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldDefault extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function() onVisible;
  final Function(String) validator;
  final bool isPassword;
  final String icons;

  const TextFieldDefault(
      {Key key,
      @required this.obscureText,
      @required this.hintText,
      @required this.inputType,
      @required this.controller,
      @required this.onVisible,
      @required this.validator,
      @required this.isPassword,
      @required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      autofocus: false,
      controller: controller,
      obscureText: this.obscureText,
      autovalidate: true,
      style: TextStyle(
          color: CustomColors.primaryTextColor,
          fontSize: Dimens.TEXT_SIZE_NORMAL),
      validator: this.validator,
      decoration: InputDecoration(
        prefixIcon: icons != null
            ? Padding(
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(this.icons))
            : null,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.fromLTRB(
            0.0, Dimens.SPACE_20, Dimens.SPACE_30, Dimens.SPACE_20),
        hintText: this.hintText,
        hintStyle: TextStyle(color: CustomColors.secondaryTextColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.lineColor),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: CustomColors.secondaryTextColor,
                ),
                onPressed: () {
                  onVisible();
                })
            : null,
      ),
    );
  }
}
