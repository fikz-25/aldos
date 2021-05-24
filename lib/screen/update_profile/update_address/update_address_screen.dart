import 'dart:convert';

import 'package:aldo/model/request/cities.dart';
import 'package:aldo/model/request/district.dart';
import 'package:aldo/model/request/province.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/tab/tab_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart' as geolocation;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateAddressScreen extends StatefulWidget {
  @override
  _UpdateAddressScreenState createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  TextEditingController _placeBuilding = TextEditingController();
  TextEditingController _compliteAddress = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String provincesId, citiesId, districtId, latitude, longitude;
  List _province, _cities, _district;
  List<Data> _listProvince = [];
  List<Cities> _listCities = [];
  List<District> _listDistrict = [];
  String state, province, district, subDistrict, address;
  bool isSwitched = false;

  void initState() {
    super.initState();
    _getProvince();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await geolocation.Geolocator()
        .getCurrentPosition(desiredAccuracy: geolocation.LocationAccuracy.high);
    if (this.mounted) {
      setState(() {
        latitude = "${position.latitude}";
        longitude = "${position.longitude}";
      });
    }
  }

  Future<void> _getProvince() async {
    final response = await http.get(ServiceApi.province);
    final datas = jsonDecode(response.body);
    setState(() {
      _province = datas['data'];
      for (Map i in _province) {
        _listProvince.add(Data.fromJson(i));
        print(Data);
      }
    });
  }

  Future<void> _getCities() async {
    final response = await http.get(ServiceApi.cities + provincesId);
    final datas = jsonDecode(response.body);
    setState(() {
      _cities = datas['data'];
      for (Map i in _cities) {
        _listCities.add(Cities.fromJson(i));
        print(Data);
      }
    });
  }

  Future<void> _getDistrict() async {
    final response = await http.get(ServiceApi.cities + provincesId);
    final datas = jsonDecode(response.body);
    setState(() {
      _district = datas['data'];
      for (Map i in _district) {
        _listDistrict.add(District.fromJson(i));
        print(Data);
      }
    });
  }

  addAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.post(ServiceApi.add_address, headers: {
      'Authorization': 'Bearer ' + token,
    }, body: {
      "name": _usernameController.text,
      "address": _addressController.text,
      "district": districtId,
      "city": citiesId,
      "province": provincesId,
      "latitude": latitude,
      "longitude": longitude,
    });
    final data = jsonDecode(response.body);
    String status = data['status'];
    String message = data['message'];
    if (response.statusCode == 201) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => TabScreen()));
      print("status : " + status);
      print("message : " + message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.formBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 4,
        title: Text(
          Strings.TEXT_INPUT_ADDRESS_TITLE,
          style: TextStyle(
            color: CustomColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(Dimens.SPACE_20),
                  color: CustomColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.TEXT_INPUT_ADDRESS_PLACE,
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_NORMAL,
                            color: CustomColors.secondaryTextColor),
                      ),
                      TextFieldDefault(
                          obscureText: false,
                          hintText: Strings.TEXT_INPUT_ADDRESS_PLACE_REQUEST,
                          inputType: TextInputType.text,
                          controller: _placeBuilding,
                          onVisible: null,
                          validator: null,
                          isPassword: false,
                          icons: null),
                    ],
                  )),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Container(
                  padding: EdgeInsets.all(Dimens.SPACE_20),
                  color: CustomColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.TEXT_INPUT_ADDRESS_PLACE,
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H4,
                            color: CustomColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Dimens.SPACE_20,
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
                          controller: _placeBuilding,
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
                          controller: _placeBuilding,
                          onVisible: null,
                          validator: null,
                          isPassword: false,
                          icons: null),
                    ],
                  )),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Container(
                padding: EdgeInsets.all(Dimens.SPACE_20),
                color: CustomColors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_COMPLETE_TITLE,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_H4,
                          color: CustomColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_STATE,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    DropdownButton(
                      isExpanded: true,
                      items: <String>[
                        'Indonesia',
                        'Singapura',
                        'Malaysia',
                        'Thailand'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem(
                          child: new Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          state = newVal;
                          print(state);
                        });
                      },
                      hint: Text(Strings.TEXT_INPUT_ADDRESS_CHOOSE_STATE),
                      value: state,
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_PROVINCE,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    DropdownButton(
                      isExpanded: true,
                      items: _listProvince.map((provinces) {
                        return new DropdownMenuItem(
                          child: new Text(provinces.province),
                          value: provinces.idProvince.toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          provincesId = newVal;
                          citiesId = null;
                          _listCities = [];
                          _getCities();
                          print(provincesId);
                        });
                      },
                      hint: Text(Strings.TEXT_INPUT_ADDRESS_PROVINCE),
                      value: provincesId,
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_DISTRICT,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    DropdownButton(
                      isExpanded: true,
                      items: _listCities.map((cities) {
                        return new DropdownMenuItem(
                          child: new Text(cities.cityName),
                          value: cities.idCities.toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          citiesId = newVal;
                          districtId = null;
                          _listDistrict = [];
                          _getDistrict();
                          print(citiesId);
                        });
                      },
                      hint: Text(Strings.TEXT_INPUT_ADDRESS_CHOOSE_SUBDISTRICT),
                      value: citiesId,
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_SUBDISTRICT,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    DropdownButton(
                      isExpanded: true,
                      items: _listDistrict.map((districts) {
                        return new DropdownMenuItem(
                          child: new Text(districts.name),
                          value: districts.idDistrict.toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          districtId = newVal;
                          print(districtId);
                        });
                      },
                      hint: Text(Strings.TEXT_INPUT_ADDRESS_CHOOSE_DISTRICT),
                      value: districtId,
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Text(
                      Strings.TEXT_INPUT_ADDRESS_COMPLETE,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    TextFormField(
                      controller: _compliteAddress,
                      keyboardType: TextInputType.text,
                      autovalidate: true,
                      maxLines: 2,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(200),
                      ],
                      style: TextStyle(
                          color: CustomColors.primaryTextColor,
                          fontSize: Dimens.TEXT_SIZE_NORMAL),
                      decoration: InputDecoration(
                          hintText: Strings.TEXT_INPUT_ADDRESS_COMPLETE_DEST,
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.fromLTRB(
                              0,
                              Dimens.SPACE_20,
                              Dimens.SPACE_30,
                              Dimens.SPACE_20),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColors.transparent),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.lineColor))),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 320),
                      child: Text(
                        "0/200",
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_NORMAL,
                            color: CustomColors.secondaryTextColor),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Row(
                      children: [
                        Text(
                          Strings.TEXT_INPUT_ADDRESS_MAIN,
                          style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H4,
                            color: CustomColors.black,
                          ),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: CustomColors.lineColor,
                          activeColor: CustomColors.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                          right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                      child: GestureDetector(
                        onTap: () {
                          addAddress();
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: ButtonDefault(
                              buttonText: Strings.TEXT_VERIFICATION_CONFIRM
                                  .toUpperCase(),
                              buttonTextColor: CustomColors.primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
