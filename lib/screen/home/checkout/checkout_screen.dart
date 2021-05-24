import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/change_address/change_address_screen.dart';
import 'package:aldo/screen/home/checkout_option/order_option/order_option_screen.dart';
import 'package:aldo/screen/home/checkout_option/payment_option/payment_option_screen.dart';
import 'package:aldo/screen/home/checkout_option/shipping_option/shipping_option_screen.dart';
import 'package:aldo/widgets/line_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
              Strings.TEXT_CHECKOUT,
              style: TextStyle(color: CustomColors.black),
            )),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: shippingAddress(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: productAdd(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: orderOption(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: shippingOption(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: paymentMethod(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: totalPrice(),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          child: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimens.SPACE_20,
                    right: Dimens.SPACE_20,
                    top: Dimens.SPACE_10,
                    bottom: Dimens.SPACE_10),
                height: Dimens.SPACE_70,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CheckoutScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: Dimens.SPACE_15, bottom: Dimens.SPACE_15),
                            decoration: BoxDecoration(
                                color: CustomColors.primaryColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimens.ROUNDED_CARDVIEW))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Strings.TEXT_BUY_NOW.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: Dimens.TEXT_SIZE_H3,
                                      color: CustomColors.whiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: Dimens.SPACE_10,
                                ),
                                SvgPicture.asset(
                                  IconsSvg.ARROW_GO_RIGHT,
                                  color: CustomColors.whiteColor,
                                ),
                              ],
                            ))),
                    SizedBox(
                      height: Dimens.SPACE_10,
                    ),
                    LineBottom()
                  ],
                )),
          ),
        ));
  }

  Widget shippingAddress() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                    Strings.TEXT_SHIPPING_ADDRESS,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_CHOOSE_ADDRESS,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Text(
            "Luxury Gold Apartement",
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Text(
            "2118 Thornridge Cir. Syracuse, Connecticut 35624",
            style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ChangeAddressScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.TEXT_CHANGE_ADDRESS,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.primaryColor),
                ),
                SizedBox(
                  width: Dimens.SPACE_5,
                ),
                SvgPicture.asset(
                  IconsSvg.ARROW_RIGHR,
                  color: CustomColors.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget productAdd() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Dimens.SPACE_100,
                child: Material(
                  child: Image.asset(
                    "assets/img/product.png",
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.ROUNDED_CARDVIEW)),
                  clipBehavior: Clip.hardEdge,
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AL-PLANER 1900 NEW",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    Strings.TEXT_HOME_MACHINERY,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Strings.TEXT_RP + " 467.000",
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: Dimens.SPACE_20,
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimens.SPACE_10),
                        decoration: BoxDecoration(
                            color: CustomColors.formBackgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.ROUNDED_CARDVIEW))),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: Dimens.SPACE_30,
                                  height: Dimens.SPACE_30,
                                  decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Dimens.ROUNDED_CARDVIEW))),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconsSvg.MIN,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: Dimens.SPACE_20,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: Dimens.TEXT_SIZE_H3,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: Dimens.SPACE_20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: Dimens.SPACE_30,
                                  height: Dimens.SPACE_30,
                                  decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Dimens.ROUNDED_CARDVIEW))),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconsSvg.PLUS,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Text(
            Strings.TEXT_INFORMATION,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_NORMAL,
                color: CustomColors.secondaryTextColor),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          TextField(
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColors.lineColor, width: 2.0),
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.ROUNDED_CARDVIEW))),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColors.lineColor, width: 2.0),
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.ROUNDED_CARDVIEW))),
              hintText: Strings.TEXT_CHECKOUT_LABEL_INPUT,
            ),
          ),
        ],
      ),
    );
  }

  Widget orderOption() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.secondaryBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(
                  IconsSvg.ORDER,
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_ORDER_OPTION,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_ORDER_OPTION_BY,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_BY_SALES,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    "Samuel",
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                      )
                    ],
                    borderRadius:
                        BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(
                  IconsSvg.ORDER_BAG,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OrderOptionScren()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.TEXT_CHANGE_ORDER,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.primaryColor),
                ),
                SizedBox(
                  width: Dimens.SPACE_5,
                ),
                SvgPicture.asset(
                  IconsSvg.ARROW_RIGHR,
                  color: CustomColors.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shippingOption() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.secondaryBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(
                  IconsSvg.TRUCK_FAST,
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_SHIPPING_OPTION,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_CHOOSE_DELIVERY,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_SHIPPING_CONTAINER,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    Strings.TEXT_RP + " 24.000",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    Strings.TEXT_SHIPPING_TIME + "June, 7 2020",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                      )
                    ],
                    borderRadius:
                        BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(
                  IconsSvg.TRUCK,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShippingOptionScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.TEXT_CHANGE_SHIPMENT,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.primaryColor),
                ),
                SizedBox(
                  width: Dimens.SPACE_5,
                ),
                SvgPicture.asset(
                  IconsSvg.ARROW_RIGHR,
                  color: CustomColors.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget paymentMethod() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.secondaryBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(Dimens.ROUNDED_CARDVIEW)),
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: SvgPicture.asset(
                  IconsSvg.PAYMENT,
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_PAYMENT_METHOD,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    Strings.TEXT_CHOOSE_PAYMENT,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.TEXT_PAYMENT_BANK_TRANFER,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    Strings.TEXT_CHECKED_MANUALLY,
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(Dimens.SPACE_10),
                child: Image.asset(
                  IconsPng.BCA_LOGO,
                  width: Dimens.SPACE_40,
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PaymentOptionScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.TEXT_CHANGE_PAYMENT,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.primaryColor),
                ),
                SizedBox(
                  width: Dimens.SPACE_5,
                ),
                SvgPicture.asset(
                  IconsSvg.ARROW_RIGHR,
                  color: CustomColors.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget totalPrice() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.TEXT_SUB_TOTAL,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 " + Strings.TEXT_ITEM,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                Strings.TEXT_RP + " 476.000",
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_20,
          ),
          Text(
            Strings.TEXT_SHIPPING_COST,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DHL Express",
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                Strings.TEXT_RP + " 24.000",
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
