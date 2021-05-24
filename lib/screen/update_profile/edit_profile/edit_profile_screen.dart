import 'dart:io';

import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/update_profile/update_address/update_address_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File _imageProfil;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  bool obscureText = true;

  _pilihGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _imageProfil = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 4,
          title: Text(
            Strings.TEXT_EDIT_PROFILE,
            style: TextStyle(color: CustomColors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        _imageProfil == null
                            ? Container(
                                width: Dimens.SPACE_100,
                                height: Dimens.SPACE_100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.lineColor),
                              )
                            : Container(
                                child: Material(
                                  child: Image.file(
                                    _imageProfil,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  clipBehavior: Clip.hardEdge,
                                ),
                              ),
                        Container(
                          padding: EdgeInsets.only(
                              left: Dimens.SPACE_30, top: Dimens.SPACE_30),
                          child: GestureDetector(
                              onTap: () {
                                _pilihGallery();
                              },
                              child: SvgPicture.asset(
                                IconsSvg.CAMERA,
                                width: Dimens.SPACE_50,
                                height: Dimens.SPACE_50,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_10,
                    ),
                    Text(
                      Strings.TEXT_CHANGE_PICTURE,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_30,
              ),
              Text(
                Strings.TEXT_REGISTER_NAME,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_NORMAL,
                    color: CustomColors.secondaryTextColor),
              ),
              TextFieldDefault(
                  obscureText: false,
                  hintText: Strings.TEXT_INPUT_NAME,
                  inputType: TextInputType.text,
                  controller: _usernameController,
                  onVisible: null,
                  validator: null,
                  isPassword: false,
                  icons: null),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Text(
                Strings.TEXT_REGISTER_NUMBER,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_NORMAL,
                    color: CustomColors.secondaryTextColor),
              ),
              TextFieldDefault(
                  obscureText: false,
                  hintText: Strings.TEXT_INPUT_PHONE,
                  inputType: TextInputType.text,
                  controller: _phoneController,
                  onVisible: null,
                  validator: null,
                  isPassword: false,
                  icons: null),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Text(
                Strings.TEXT_EMAIL,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_NORMAL,
                    color: CustomColors.secondaryTextColor),
              ),
              TextFieldDefault(
                  obscureText: false,
                  hintText: Strings.TEXT_INPUT_EMAIL,
                  inputType: TextInputType.text,
                  controller: _emailController,
                  onVisible: null,
                  validator: null,
                  isPassword: false,
                  icons: null),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Text(
                Strings.TEXT_PASS,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_NORMAL,
                    color: CustomColors.secondaryTextColor),
              ),
              TextFieldDefault(
                  obscureText: obscureText,
                  hintText: Strings.TEXT_PASS,
                  inputType: TextInputType.text,
                  controller: _passwordController,
                  onVisible: null,
                  validator: null,
                  isPassword: true,
                  icons: null),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Text(
                Strings.TEXT_BIO,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_NORMAL,
                    color: CustomColors.secondaryTextColor),
              ),
              TextFormField(
                controller: _bioController,
                keyboardType: TextInputType.text,
                autovalidate: true,
                maxLines: 2,
                style: TextStyle(
                    color: CustomColors.primaryTextColor,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
                decoration: InputDecoration(
                    hintText: Strings.TEXT_INPUT_BIO,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.fromLTRB(
                        0, Dimens.SPACE_20, Dimens.SPACE_30, Dimens.SPACE_20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.transparent),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.lineColor))),
              ),
              SizedBox(
                height: Dimens.SPACE_60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              UpdateAddressScreen()));
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ButtonDefault(
                      buttonText: Strings.TEXT_NEXT_STEP,
                      buttonTextColor: CustomColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
