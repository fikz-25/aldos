import 'dart:convert';
import 'dart:io';
import 'package:aldo/commons/decoration.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/screen/auth/register/register_screen.dart';
import 'package:aldo/screen/home/home/home_screen.dart';
import 'package:aldo/screen/home/tab/tab_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  String fcm = '5205716c-7bc6-4db7-8bcb-6c20b7abac5a';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo;
  IosDeviceInfo iosDeviceInfo;
  String brand, model, thisPhone;

  @override
  void initState() {
    super.initState();
    getDeviceinfo();
  }

  void getDeviceinfo() async {
    if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfo
          .androidInfo; // instantiate Android Device Infoformation
      setState(() {
        brand = androidDeviceInfo.brand;
        model = androidDeviceInfo.model;
      });
    } else if (Platform.isIOS) {
      iosDeviceInfo =
          await deviceInfo.iosInfo; // instantiate Android Device Infoformation
      setState(() {
        model = androidDeviceInfo.model;
      });
    }
  }

  login() async {
    final response = await http.post(ServiceApi.login, body: {
      "phone": _emailController,
      "password": _passwordController.text,
      "fcm": fcm,
      "device": Platform.isAndroid ? brand + " " + model : model,
    });
    final data = jsonDecode(response.body);
    String status = data['status'];
    String message = data['message'];
    String token = data['token'];
    if (response.statusCode == 201) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', '$token');
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      print("status : " + status);
      print("message : " + message);
      print("token : " + token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.primaryColor,
        body: Platform.isIOS
            ? Container(
                child: viewContent(),
              )
            : SafeArea(child: viewContent()));
  }

  Widget viewContent() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/img/logo.png'),
                    SizedBox(
                      height: Dimens.SPACE_10,
                    ),
                    Text(
                      Strings.TEXT_TITLE.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CustomColors.whiteColor,
                          fontSize: Dimens.TEXT_SIZE_H1,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Strings.TEXT_GET_STARTED_DEST,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CustomColors.whiteColor),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                    right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                decoration: CustomDecoration.createBox(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: Dimens.SPACE_40),
                    Center(
                      child: Text(
                        Strings.TEXT_REGISTER_WELCOME,
                        style: TextStyle(
                            color: CustomColors.primaryTextColor,
                            fontSize: Dimens.TEXT_SIZE_H2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: Dimens.SPACE_40),
                    Text(
                      Strings.TEXT_LOGIN_REQUEST,
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                    ),
                    SizedBox(height: Dimens.SPACE_10),
                    TextFieldDefault(
                        icons: IconsSvg.EMAIL,
                        obscureText: false,
                        isPassword: false,
                        inputType: TextInputType.text,
                        hintText: Strings.TEXT_EMAIL,
                        controller: _emailController,
                        onVisible: null,
                        validator: null),
                    SizedBox(height: Dimens.SPACE_20),
                    TextFieldDefault(
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
                    SizedBox(height: Dimens.SPACE_20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          login();
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: ButtonDefault(
                              buttonText: Strings.TEXT_LOGIN,
                              buttonTextColor: CustomColors.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.SPACE_20),
                    Center(
                      child: GestureDetector(
                        onTap: () => {},
                        child: Text(
                          Strings.TEXT_FORGET_PASS.toUpperCase(),
                          style: TextStyle(
                              color: CustomColors.primaryColor,
                              fontSize: Dimens.TEXT_SIZE_H6),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.SPACE_60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(Strings.TEXT_LOGIN_DOESNT_HAVE_ACCOUNT,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H6,
                                color: CustomColors.secondaryTextColor)),
                        SizedBox(width: Dimens.SPACE_5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RegisterScreen()));
                          },
                          child: Text(Strings.TEXT_REGISTER.toUpperCase(),
                              style: TextStyle(
                                  fontSize: Dimens.TEXT_SIZE_H6,
                                  color: CustomColors.primaryColor,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    SizedBox(height: Dimens.SPACE_60),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
