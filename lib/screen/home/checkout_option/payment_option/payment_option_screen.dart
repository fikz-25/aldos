import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:flutter/material.dart';

class PaymentOptionScreen extends StatefulWidget {
  @override
  _PaymentOptionScreenState createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  int containerSelected;

  @override
  void initState() {
    super.initState();
    containerSelected = 0;
  }

  setContainerSelected(int val) {
    setState(() {
      containerSelected = val;
      print(containerSelected);
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
            Strings.TEXT_SHIPPING_OPTION,
            style: TextStyle(color: CustomColors.black),
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                right: Dimens.SPACE_DEFAULT_MARGIN_LR),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimens.SPACE_20,
                ),
                Text(
                  Strings.TEXT_RECOMENDED,
                  style: TextStyle(
                      color: CustomColors.primaryTextColor,
                      fontSize: Dimens.TEXT_SIZE_H3,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Dimens.SPACE_20,
                ),
                containerOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerOption() {
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
                    padding: EdgeInsets.all(Dimens.SPACE_10),
                    child: Image.asset(
                      IconsPng.BCA_LOGO,
                      width: Dimens.SPACE_40,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_BANK_BCA,
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ],
              ),
              Radio(
                  value: 1,
                  groupValue: containerSelected,
                  activeColor: CustomColors.primaryColor,
                  onChanged: (val) {
                    print(val);
                    setContainerSelected(val);
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimens.SPACE_10),
                    child: Image.asset(
                      IconsPng.BRI_LOGO,
                      width: Dimens.SPACE_40,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_BANK_BRI,
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ],
              ),
              Radio(
                  value: 2,
                  groupValue: containerSelected,
                  activeColor: CustomColors.primaryColor,
                  onChanged: (val) {
                    print(val);
                    setContainerSelected(val);
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimens.SPACE_10),
                    child: Image.asset(
                      IconsPng.MANDIRI_LOGO,
                      width: Dimens.SPACE_40,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_BANK_MANDIRI,
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ],
              ),
              Radio(
                  value: 3,
                  groupValue: containerSelected,
                  activeColor: CustomColors.primaryColor,
                  onChanged: (val) {
                    print(val);
                    setContainerSelected(val);
                  })
            ],
          )
        ],
      ),
    );
  }
}
