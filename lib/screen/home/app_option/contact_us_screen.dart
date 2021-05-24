import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
            Strings.TEXT_CONTACT_US,
            style: TextStyle(color: CustomColors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    IconsPng.CONTACT_US_BG,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimens.SPACE_30),
                    child: Center(
                        child: Image.asset(
                      IconsPng.CONTACT_US_IMG,
                      width: 200,
                    )),
                  )
                ],
              ),
              SizedBox(
                height: Dimens.SPACE_40,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: Text(
                    Strings.TEXT_SEND_EMAIL,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                    right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconsSvg.EMAIL,
                            color: CustomColors.lineColor,
                          ),
                          SizedBox(
                            width: Dimens.SPACE_10,
                          ),
                          Text(
                            "aldo@company.com",
                            style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.secondaryTextColor,
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        IconsSvg.ARROW_RIGHR,
                        color: CustomColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  child: Text(
                    Strings.TEXT_CALL_CENTER,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                    right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconsSvg.PHONE,
                            color: CustomColors.lineColor,
                          ),
                          SizedBox(
                            width: Dimens.SPACE_10,
                          ),
                          Text(
                            "667-009",
                            style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_NORMAL,
                              color: CustomColors.secondaryTextColor,
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        IconsSvg.ARROW_RIGHR,
                        color: CustomColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
