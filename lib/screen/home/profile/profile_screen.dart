import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/app_option/contact_us_screen.dart';
import 'package:aldo/screen/home/app_option/help_screen.dart';
import 'package:aldo/screen/home/app_option/terms_conditions_screen.dart';
import 'package:aldo/screen/home/change_address/change_address_screen.dart';
import 'package:aldo/screen/update_profile/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.primaryColor,
          elevation: 0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.TEXT_MY_PROFILE,
                  style: TextStyle(color: CustomColors.whiteColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          IconsSvg.CART,
                          color: CustomColors.whiteColor,
                        )),
                    SizedBox(
                      width: Dimens.SPACE_20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconsSvg.BELL,
                        color: CustomColors.whiteColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: Dimens.SPACE_20, right: Dimens.SPACE_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: Dimens.SPACE_30,
                      backgroundImage: AssetImage("assets/img/piople.jpg")),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lexa Griffin",
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H2,
                            color: CustomColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Dimens.SPACE_5,
                      ),
                      Text(
                        "ringim88@gmail.com",
                        style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_H3,
                          color: CustomColors.whiteColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Dimens.SPACE_30,
              ),
              userData(),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              appOption(),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              exit(),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userData() {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
      padding: EdgeInsets.all(Dimens.SPACE_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditProfileScreen()));
            },
            child: Container(
              height: Dimens.SPACE_40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsSvg.KID,
                        color: CustomColors.primaryColor,
                      ),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TEXT_EDIT_PROFILE,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H4,
                                color: CustomColors.primaryTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimens.SPACE_5,
                          ),
                          Text(
                            Strings.TEXT_SEE_PROFILE,
                            style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H5,
                              color: CustomColors.secondaryTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset(
                    IconsSvg.ARROW_RIGHR,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ChangeAddressScreen()));
            },
            child: Container(
              height: Dimens.SPACE_40,
              child: Container(
                height: Dimens.SPACE_40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconsSvg.PIN_LOCATION,
                          color: CustomColors.primaryColor,
                        ),
                        SizedBox(
                          width: Dimens.SPACE_10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.TEXT_YOUR_ADDRESS,
                              style: TextStyle(
                                  fontSize: Dimens.TEXT_SIZE_H4,
                                  color: CustomColors.primaryTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Dimens.SPACE_5,
                            ),
                            Text(
                              "Surabaya, Jawa Timur ",
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H5,
                                color: CustomColors.secondaryTextColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      IconsSvg.ARROW_RIGHR,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appOption() {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
      padding: EdgeInsets.all(Dimens.SPACE_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HelpScrenn()));
            },
            child: Container(
              height: Dimens.SPACE_40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsSvg.HELP,
                        color: CustomColors.primaryColor,
                      ),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TEXT_HELP,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H4,
                                color: CustomColors.primaryTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimens.SPACE_5,
                          ),
                          Text(
                            Strings.TEXT_HELP_DESC,
                            style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H5,
                              color: CustomColors.secondaryTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset(
                    IconsSvg.ARROW_RIGHR,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ContactUsScreen()));
            },
            child: Container(
              height: Dimens.SPACE_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsSvg.CALL,
                        color: CustomColors.primaryColor,
                      ),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TEXT_CONTACT_US,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H4,
                                color: CustomColors.primaryTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimens.SPACE_5,
                          ),
                          Text(
                            Strings.TEXT_CONTACT_US_DESC,
                            style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H5,
                              color: CustomColors.secondaryTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset(
                    IconsSvg.ARROW_RIGHR,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TermsConditionScreen()));
            },
            child: Container(
              height: Dimens.SPACE_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsSvg.PROFILE_BAG,
                        color: CustomColors.primaryColor,
                      ),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Text(
                        Strings.TEXT_TERMS_AND_CONDITIONS,
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H4,
                            color: CustomColors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SvgPicture.asset(
                    IconsSvg.ARROW_RIGHR,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: Dimens.SPACE_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsSvg.SHIELD,
                        color: CustomColors.primaryColor,
                      ),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Text(
                        Strings.TEXT_PRIVACY,
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H4,
                            color: CustomColors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SvgPicture.asset(
                    IconsSvg.ARROW_RIGHR,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget exit() {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
      padding: EdgeInsets.all(Dimens.SPACE_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconsSvg.EXIT,
                      color: CustomColors.primaryColor,
                    ),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.TEXT_EXIT,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H4,
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_5,
                        ),
                        Text(
                          Strings.TEXT_EXIT_DESC,
                          style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H5,
                            color: CustomColors.secondaryTextColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SvgPicture.asset(
                  IconsSvg.ARROW_RIGHR,
                  color: CustomColors.whiteColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
