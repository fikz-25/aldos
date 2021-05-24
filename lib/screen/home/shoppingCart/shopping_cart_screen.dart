import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:aldo/widgets/card_product.dart';
import 'package:aldo/widgets/line_bottom.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int buyProduct = 0;

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
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_SHOPPING_CART,
                style: TextStyle(
                  color: CustomColors.black,
                ),
              ),
              Image.asset(
                'assets/icon/search.png',
                color: CustomColors.black,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buyProduct == 0
                  ? _noProductAdd()
                  : Column(
                      children: [
                        _productAdd(),
                        SizedBox(
                          height: Dimens.SPACE_5,
                        ),
                      ],
                    ),
              Container(
                  color: CustomColors.whiteColor,
                  padding: const EdgeInsets.only(
                      left: Dimens.SPACE_20, top: Dimens.SPACE_20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.TEXT_SHOPPING_RECOMMENT,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H4,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: Dimens.SPACE_10,
                      ),
                      _recomProduct(),
                      SizedBox(
                        height: Dimens.SPACE_30,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: buyProduct == 0
          ? SizedBox()
          : Container(
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
                    height: Dimens.SPACE_90,
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: CustomColors.primaryColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimens.SPACE_10))),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.SPACE_15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Strings.TEXT_TOTAL_PRICE + " (2 item)",
                                        style: TextStyle(
                                            color: CustomColors.whiteColor),
                                      ),
                                      SizedBox(
                                        height: Dimens.SPACE_10,
                                      ),
                                      Text(
                                        Strings.TEXT_RP + " 840.000",
                                        style: TextStyle(
                                            fontSize: Dimens.TEXT_SIZE_H4,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimens.SPACE_90,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color:
                                              CustomColors.secondaryButtonColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimens.SPACE_10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            Dimens.SPACE_15),
                                        child: Row(
                                          children: [
                                            Text(
                                              Strings.TEXT_CHECKOUT,
                                              style: TextStyle(
                                                  fontSize: Dimens.TEXT_SIZE_H4,
                                                  color:
                                                      CustomColors.whiteColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: Dimens.SPACE_10,
                                            ),
                                            Image.asset(
                                                "assets/icon/arrow_go.png")
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: Dimens.SPACE_5,
                        ),
                        LineBottom()
                      ],
                    )),
              ),
            ),
    );
  }

  Widget _productAdd() {
    return Container(
        color: CustomColors.whiteColor,
        padding: const EdgeInsets.only(
            left: Dimens.SPACE_20,
            right: Dimens.SPACE_20,
            top: Dimens.SPACE_20),
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 2,
            itemBuilder: (context, i) {
              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimens.ROUNDED_CARDVIEW),
                      child: Image.asset(
                        'assets/img/product.png',
                        width: Dimens.SPACE_90,
                      ),
                    ),
                    SizedBox(
                      width: Dimens.SPACE_15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AL-D.Wheel 4”X40T Multi",
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H4,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_5,
                        ),
                        Text(
                          Strings.TEXT_HOME_DRILL,
                          style: TextStyle(fontSize: Dimens.TEXT_SIZE_H5),
                        ),
                        SizedBox(
                          height: Dimens.SPACE_10,
                        ),
                        Row(
                          children: [
                            Text(
                              Strings.TEXT_RP + " 455.000",
                              style: TextStyle(
                                  fontSize: Dimens.TEXT_SIZE_H5,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: Dimens.SPACE_50,
                            ),
                            Container(
                              padding: EdgeInsets.all(Dimens.SPACE_10),
                              decoration: BoxDecoration(
                                  color: CustomColors.formBackgroundColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          Dimens.ROUNDED_CARDVIEW))),
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
                                            child: Image.asset(
                                                'assets/icon/minus.png'))),
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
                                            child: Image.asset(
                                                'assets/icon/plus.png'))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimens.SPACE_20,
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  Widget _noProductAdd() {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.SPACE_DEFAULT_MARGIN_LR,
          right: Dimens.SPACE_DEFAULT_MARGIN_LR,
          top: Dimens.SPACE_DEFAULT_MARGIN_LR),
      color: CustomColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/img/noCart.png"),
          SizedBox(
            height: Dimens.SPACE_20,
          ),
          Text(
            Strings.TEXT_NOCART_TITLE,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimens.SPACE_50, right: Dimens.SPACE_50),
            child: Text(
              Strings.TEXT_NOCART_DESC,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Dimens.TEXT_SIZE_NORMAL,
                  color: CustomColors.secondaryTextColor),
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_20,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                right: Dimens.SPACE_DEFAULT_MARGIN_LR),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: ButtonDefault(
                    buttonText: Strings.TEXT_SHOP_NOW,
                    buttonTextColor: CustomColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recomProduct() {
    return Container(
      height: 340,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, i) {
            return Container(child: CardProduct());
          }),
    );
  }
}
