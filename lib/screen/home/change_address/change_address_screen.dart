import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/update_profile/update_address/update_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeAddressScreen extends StatefulWidget {
  @override
  _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 4,
          title: Text(
            Strings.TEXT_CHANGE_ADDRESS,
            style: TextStyle(color: CustomColors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                child: userAddress(),
              ),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.SPACE_50, right: Dimens.SPACE_50),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimens.ROUNDED_CARDVIEW),
                      side: BorderSide(color: CustomColors.primaryColor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                UpdateAddressScreen()));
                  },
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: Dimens.SPACE_15,
                      bottom: Dimens.SPACE_15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconsSvg.PLUS,
                          color: CustomColors.primaryColor,
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        Text(
                          Strings.TEXT_ADD_NEW_ADDRESS,
                          style: TextStyle(color: CustomColors.primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userAddress() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: CustomColors.secondaryBackgroundColor,
                        borderRadius:
                            BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                    padding: EdgeInsets.all(Dimens.SPACE_10),
                    child: SvgPicture.asset(
                      IconsSvg.PIN_LOCATION,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Luxury Gold Apartment",
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Dimens.SPACE_5,
                      ),
                      Text(
                        "[" + Strings.TEXT_MAIN_ADDRESS + "]",
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_NORMAL,
                            color: isSwitched == true
                                ? CustomColors.primaryColor
                                : CustomColors.secondaryTextColor),
                      ),
                    ],
                  ),
                ],
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
            height: Dimens.SPACE_10,
          ),
          Text(
            "Lexa Griffin",
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            "(+234)0944095840 ",
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            "2118 Thornridge Cir. Syracuse, Connecticut 35624",
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            Strings.TEXT_INPUT_ADDRESS_SUBDISTRICT,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            Strings.TEXT_INPUT_ADDRESS_DISTRICT,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            Strings.TEXT_INPUT_ADDRESS_PROVINCE,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_5,
          ),
          Text(
            "State-Postal Code",
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
