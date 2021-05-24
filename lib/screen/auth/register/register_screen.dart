import 'dart:convert';
import 'dart:io';
import 'package:aldo/commons/decoration.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/screen/auth/login/login_screen.dart';
import 'package:aldo/screen/auth/verification/verification_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  bool obscureText = true;
  int duration = 90;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  registerUser() async {
    final response = await http.post(ServiceApi.register, body: {
      "name": _usernameController.text,
      "phone": _numberController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "repassword": _repeatPasswordController.text
    });
    final data = jsonDecode(response.body);
    String status = data['status'];
    String message = data['message'];
    if (response.statusCode == 201) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('phone', '${_numberController.text}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => VerificationScreen()));
    }
    print("status : " + status);
    print("message : " + message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: (Platform.isIOS)
          ? Container(
              child: viewContent(),
            )
          : SafeArea(
              child: viewContent(),
            ),
    );
  }

  Widget viewContent() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/logo.png'),
              SizedBox(
                width: Dimens.SPACE_10,
              ),
              Column(
                children: [
                  Text(
                    Strings.TEXT_REGISTER_TITLE.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: Dimens.TEXT_SIZE_H1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_REGISTER_DESC,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: CustomColors.whiteColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_20,
          ),
          Container(
            decoration: CustomDecoration.createBox(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: Dimens.SPACE_40),
                Center(
                  child: Text(
                    Strings.TEXT_REGISTER_INSTRUCTION,
                    style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontSize: Dimens.TEXT_SIZE_H2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: Dimens.SPACE_40),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: Text(
                    Strings.TEXT_REGISTER_REQUEST,
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ),
                SizedBox(height: Dimens.SPACE_10),
                Padding(
                    padding: EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: TextFieldDefault(
                        icons: IconsSvg.USER_NAME,
                        obscureText: false,
                        isPassword: false,
                        inputType: TextInputType.text,
                        hintText: Strings.TEXT_REGISTER_NAME,
                        controller: _usernameController,
                        onVisible: null,
                        validator: null)),
                SizedBox(height: Dimens.SPACE_20),
                Padding(
                    padding: EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: TextFieldDefault(
                        icons: IconsSvg.PHONE,
                        obscureText: false,
                        isPassword: false,
                        inputType: TextInputType.number,
                        hintText: Strings.TEXT_REGISTER_NUMBER,
                        controller: _numberController,
                        onVisible: null,
                        validator: null)),
                SizedBox(height: Dimens.SPACE_20),
                Padding(
                    padding: EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: TextFieldDefault(
                        icons: IconsSvg.EMAIL,
                        obscureText: false,
                        isPassword: false,
                        inputType: TextInputType.text,
                        hintText: Strings.TEXT_EMAIL,
                        controller: _emailController,
                        onVisible: null,
                        validator: null)),
                SizedBox(height: Dimens.SPACE_20),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: TextFieldDefault(
                    icons: IconsSvg.LOCK,
                    obscureText: obscureText,
                    isPassword: true,
                    inputType: TextInputType.text,
                    hintText: Strings.TEXT_PASS,
                    controller: _passwordController,
                    onVisible: () {
                      _toggle();
                    },
                    validator: null,
                  ),
                ),
                SizedBox(height: Dimens.SPACE_20),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: TextFieldDefault(
                    icons: IconsSvg.LOCK,
                    obscureText: obscureText,
                    isPassword: true,
                    inputType: TextInputType.text,
                    hintText: Strings.TEXT_REGISTER_REPEAT_PASS,
                    controller: _repeatPasswordController,
                    onVisible: () {
                      _toggle();
                    },
                    validator: null,
                  ),
                ),
                SizedBox(height: Dimens.SPACE_20),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: GestureDetector(
                      onTap: () {
                        registerUser();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ButtonDefault(
                            buttonText: Strings.TEXT_REGISTER.toUpperCase(),
                            buttonTextColor: CustomColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.SPACE_20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Strings.TEXT_REGISTER_AGREEMENT,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.secondaryTextColor)),
                      SizedBox(height: Dimens.SPACE_5),
                      GestureDetector(
                        onTap: () => {},
                        child: Text(
                          Strings.TEXT_REGISTER_TERMS_CONDITIONS,
                          style: TextStyle(
                              color: CustomColors.blueColor,
                              fontSize: Dimens.TEXT_SIZE_NORMAL),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimens.SPACE_60),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(Strings.TEXT_REGISTER_HAVE_ACCOUNT,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.secondaryTextColor)),
                      SizedBox(width: Dimens.SPACE_5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()));
                        },
                        child: Text(Strings.TEXT_LOGIN.toUpperCase(),
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_NORMAL,
                                color: CustomColors.primaryColor,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimens.SPACE_60),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
