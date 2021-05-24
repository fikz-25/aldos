import 'dart:convert';
import 'dart:io';

import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/update_profile/update_address/update_address_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfilScreen extends StatefulWidget {
  @override
  _UpdateProfilScreenState createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {
  File _imageProfil;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  final _key = new GlobalKey<FormState>();
  Map<String, String> headers;

  _pilihGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _imageProfil = image;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    setState(() {
      headers = {'Authorization': 'Bearer ' + token};
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
  }

  submit() async {
    try {
      // var stream =
      //     http.ByteStream(DelegatingStream.typed(_imageProfil.openRead()));
      // var length = await _imageProfil.length();
      var url = Uri.parse(ServiceApi.update_profile);
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);
      request.fields['name'] = _usernameController.text;
      request.fields['email'] = _emailController.text;
      request.fields['phone'] = _phoneController.text;
      request.fields['bio'] = _bioController.text;
      // request.files.add(http.MultipartFile("thumbnail", stream, length,
      //     filename: path.basename(_imageProfil.path)));
      final response = await request.send();
      if (response.statusCode == 200) {
        print("update succes");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => UpdateAddressScreen()));
      } else {
        print("update failed");
      }
    } catch (e) {
      debugPrint("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
          child: SafeArea(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          Strings.TEXT_INPUT_PROFIL_WELCOME,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H4,
                              color: CustomColors.secondaryTextColor),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_5,
                        ),
                        Text(
                          Strings.TEXT_INPUT_PROFIL_DESC,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H2,
                              color: CustomColors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_30,
                        ),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      clipBehavior: Clip.hardEdge,
                                    ),
                                  ),
                            GestureDetector(
                              onTap: () {
                                _pilihGallery();
                              },
                              child: Image.asset(
                                'assets/icon/camera.png',
                                width: Dimens.SPACE_100,
                                height: Dimens.SPACE_100,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimens.SPACE_10,
                        ),
                        Text(
                          Strings.TEXT_INPUT_PROFIL_PICTURE,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.secondaryTextColor),
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
                        contentPadding: EdgeInsets.fromLTRB(0, Dimens.SPACE_20,
                            Dimens.SPACE_30, Dimens.SPACE_20),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomColors.transparent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColors.lineColor))),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_60,
                  ),
                  GestureDetector(
                    onTap: () {
                      submit();
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
        ),
      ),
    );
  }
}
