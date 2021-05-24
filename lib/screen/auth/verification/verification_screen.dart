import 'dart:convert';
import 'dart:io';

import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/home/home_screen.dart';
import 'package:aldo/screen/update_profile/update_profil_user/update_profile_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController _pinController = TextEditingController();
  TextEditingController _newEmail = TextEditingController();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo;
  IosDeviceInfo iosDeviceInfo;
  String brand, model, thisPhone;

  bool countdown = true;

  @override
  void initState() {
    super.initState();
    getNumber();
    getDeviceinfo();
  }

  getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.getString('phone');
    setState(() {
      thisPhone = phone;
    });
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

  String fcm = '5205716c-7bc6-4db7-8bcb-6c20b7abac5a';

  verify() async {
    final response = await http.post(ServiceApi.verify, body: {
      "phone": thisPhone,
      "otp": _pinController.text,
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
    }
    print("token : " + token);
    print("status : " + status);
    print("message : " + message);
  }

  resendOTP() async {
    final response =
        await http.post('https://aldo.lumira.live/api/user/resend', body: {
      "phone": thisPhone,
    });
    final data = jsonDecode(response.body);
    String status = data['status'];
    String message = data['message'];
    print("status : " + status);
    print("message : " + message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Container(
        padding: EdgeInsets.only(top: 24.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/img/checked.png'),
                  SizedBox(
                    height: Dimens.SPACE_20,
                  ),
                  Text(
                    Strings.TEXT_VERIFICATION_TITLE,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H2,
                        color: CustomColors.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimens.SPACE_10),
                  Text(
                    Strings.TEXT_VERIFICATION_REQUEST,
                    style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_H5,
                      color: CustomColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(height: Dimens.SPACE_5),
                  Text(
                    "lexa88@gmail.com",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H5,
                        color: CustomColors.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_40,
                  ),
                  countdownTime(),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    Strings.TEXT_VERIFICATION_DIDNT_RECEIVE_CODE,
                    style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontSize: Dimens.TEXT_SIZE_H5),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  GestureDetector(
                    onTap: () {
                      countdown == false ? resendOTP() : '';
                    },
                    child: Text(
                      Strings.TEXT_VERIFICATION_RESEND_CODE,
                      style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontSize: Dimens.TEXT_SIZE_H5),
                    ),
                  ),
                  inputCode(),
                  SizedBox(
                    height: Dimens.SPACE_15,
                  ),
                  Text(
                    Strings.TEXT_VERIFICATION_INCORRECT_EMAIL,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.primaryTextColor),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  GestureDetector(
                    onTap: () => {_changeEmail()},
                    child: Text(Strings.TEXT_VERIFICATION_CHANGE_EMAIL,
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_NORMAL,
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget countdownTime() {
    return Container(
      child: CountdownFormatted(
        onFinish: () {
          setState(() {
            countdown = false;
          });
        },
        duration: Duration(seconds: 90),
        builder: (BuildContext ctx, String remaining) {
          return Text(
            remaining,
            style: TextStyle(fontSize: Dimens.TEXT_SIZE_H1),
          ); // 01:00:00
        },
      ),
    );
  }

  Widget inputCode() {
    return Container(
      margin: EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
      child: Container(
        padding: EdgeInsets.all(Dimens.SPACE_10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW)),
          boxShadow: [
            BoxShadow(
              color: CustomColors.otpLine,
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Form(
                child: PinCodeTextField(
                    controller: _pinController,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                        color: CustomColors.otpLine,
                        fontWeight: FontWeight.bold),
                    length: 4,
                    obsecureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        activeColor: CustomColors.otpLine,
                        inactiveColor: CustomColors.otpLine,
                        selectedColor: CustomColors.otpLine),
                    onChanged: (value) {
                      print(_pinController.text);
                    })),
            buttonConfirm(),
          ],
        ),
      ),
    );
  }

  Widget buttonConfirm() {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.SPACE_30,
          right: Dimens.SPACE_30,
          bottom: Dimens.SPACE_10),
      child: GestureDetector(
        onTap: () {
          verify();
        },
        child: SizedBox(
          width: double.infinity,
          child: ButtonDefault(
              buttonText: Strings.TEXT_VERIFICATION_CONFIRM.toUpperCase(),
              buttonTextColor: CustomColors.primaryColor),
        ),
      ),
    );
  }

  void _changeEmail() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(Dimens.ROUNDED_CORNER),
                    topRight: const Radius.circular(Dimens.ROUNDED_CORNER),
                  )),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimens.SPACE_15,
                    right: Dimens.SPACE_15,
                    top: Dimens.SPACE_15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/icon/close.png'),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.TEXT_CHANGE_EMAIL,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H2,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_20,
                        ),
                        Text(
                          Strings.TEXT_CHANGE_EMAIL_DESC,
                          style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_NORMAL,
                          ),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_10,
                        ),
                        TextField(
                          autofocus: false,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.primaryTextColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: CustomColors.formBackgroundColor,
                            hintText: Strings.TEXT_CHANGE_EMAIL_REQUEST,
                            contentPadding:
                                const EdgeInsets.all(Dimens.SPACE_10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.circular(Dimens.SPACE_10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.circular(Dimens.SPACE_10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                              right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: double.infinity,
                              child: ButtonDefault(
                                  buttonText: Strings.TEXT_VERIFY_EMAIL,
                                  buttonTextColor: CustomColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
