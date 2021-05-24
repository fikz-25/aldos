import 'dart:convert';

import 'package:aldo/model/request/product.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/checkout/checkout_screen.dart';
import 'package:aldo/widgets/button_defauld.dart';
import 'package:aldo/widgets/card_product.dart';
import 'package:aldo/widgets/line_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class DetailProductScreen extends StatefulWidget {
  final Product products;
  DetailProductScreen({Key key, this.products}) : super(key: key);
  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  List _product;
  List<Product> _listProduct = [];

  var loading = false;

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  Future<void> _getProduct() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(ServiceApi.product);
    final datas = jsonDecode(response.body);
    setState(() {
      _product = datas['data'];
      for (Map i in _product) {
        _listProduct.add(Product.fromJson(i));
        print(_product);
        loading = false;
      }
    });
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
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.TEXT_DETAIL_PRODUCT,
                  style: TextStyle(
                    color: CustomColors.black,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: SvgPicture.asset(
                        IconsSvg.SHARE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimens.SPACE_20),
                      child: SvgPicture.asset(
                        IconsSvg.CART,
                        color: CustomColors.black,
                      ),
                    ),
                  ],
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
                Container(
                  color: CustomColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Image.network(
                              "https://aldo.lumira.live/uploads/10847525_7a0227bc-7a82-4c79-aafe-e0728ab8435d_768_1280%20%281%29.jpg",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: Dimens.SPACE_DEFAULT_MARGIN_LR,
                                    top: Dimens.SPACE_DEFAULT_MARGIN_LR),
                                padding: EdgeInsets.only(
                                    left: Dimens.SPACE_20,
                                    right: Dimens.SPACE_20,
                                    top: Dimens.SPACE_10,
                                    bottom: Dimens.SPACE_10),
                                decoration: BoxDecoration(
                                    color: CustomColors.black,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            Dimens.ROUNDED_CARDVIEW))),
                                child: Text(
                                  '1/4',
                                  style: TextStyle(
                                      fontSize: Dimens.TEXT_SIZE_H4,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.whiteColor),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 280,
                                right: Dimens.SPACE_DEFAULT_MARGIN_LR,
                                bottom: Dimens.SPACE_5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.5,
                                          color: Colors.black45,
                                          spreadRadius: 0.5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: CustomColors.whiteColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(Dimens.SPACE_5),
                                      child: SvgPicture.asset(
                                        IconsSvg.MESSAGE,
                                        color: CustomColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimens.SPACE_10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.5,
                                          color: Colors.black45,
                                          spreadRadius: 0.5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: CustomColors.whiteColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(Dimens.SPACE_5),
                                      child: SvgPicture.asset(
                                        IconsSvg.HEART,
                                        color: CustomColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimens.SPACE_10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                            right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                        child: productTitle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: shipment(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        top: Dimens.SPACE_20,
                        bottom: Dimens.SPACE_20),
                    child: spesification(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        top: Dimens.SPACE_20,
                        bottom: Dimens.SPACE_20),
                    child: description(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                    child: customerReviews(),
                  ),
                ),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Container(
                  color: CustomColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                        top: Dimens.SPACE_20,
                        bottom: Dimens.SPACE_20),
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : similarProducts(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimens.ROUNDED_CARDVIEW),
                              side:
                                  BorderSide(color: CustomColors.primaryColor)),
                          onPressed: () {},
                          color: CustomColors.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              IconsSvg.CART,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CheckoutScreen()));
                          },
                          child: Container(
                            width: 250,
                            child: ButtonDefault(
                                buttonText:
                                    Strings.TEXT_ORDER_NOW.toUpperCase(),
                                buttonTextColor: CustomColors.whiteColor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_10,
                    ),
                    LineBottom()
                  ],
                )),
          ),
        ));
  }

  Widget productTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.products.name.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimens.TEXT_SIZE_H2)),
        SizedBox(
          height: Dimens.SPACE_10,
        ),
        Text(
          Strings.TEXT_HOME_MACHINERY,
          style: TextStyle(color: CustomColors.secondaryTextColor),
        ),
        SizedBox(
          height: Dimens.SPACE_15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.TEXT_RP + widget.products.price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.TEXT_SIZE_H2)),
                SizedBox(
                  height: Dimens.SPACE_10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBarIndicator(
                      rating: widget.products.review.toDouble(),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: CustomColors.primaryColor,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Text("4.5",
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Text(
                      ("(124 sold)"),
                      style: TextStyle(color: CustomColors.secondaryTextColor),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(Dimens.SPACE_5),
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
                                Radius.circular(Dimens.ROUNDED_CARDVIEW))),
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
                                Radius.circular(Dimens.ROUNDED_CARDVIEW))),
                        child: Center(
                          child: SvgPicture.asset(
                            IconsSvg.PLUS,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.SPACE_20,
        ),
        productRecort(),
        SizedBox(
          height: Dimens.SPACE_20,
        ),
      ],
    );
  }

  Widget productRecort() {
    return Container(
      padding: EdgeInsets.all(Dimens.SPACE_20),
      decoration: BoxDecoration(
          color: CustomColors.formBackgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsSvg.EYE,
                color: CustomColors.primaryColor,
              ),
              SizedBox(
                height: Dimens.SPACE_15,
              ),
              Text(
                '224',
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H4, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Text(
                Strings.TEXT_SEEN,
                style: TextStyle(color: CustomColors.secondaryTextColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsSvg.TRUCK_CHECKLIST,
                color: CustomColors.primaryColor,
              ),
              SizedBox(
                height: Dimens.SPACE_15,
              ),
              Text(
                '100% (20 Products) ',
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H4, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Text(
                Strings.TEXT_TRANSACTION_SUCCESSFUL,
                style: TextStyle(color: CustomColors.secondaryTextColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsSvg.WISHLIST,
                color: CustomColors.primaryColor,
              ),
              SizedBox(
                height: Dimens.SPACE_15,
              ),
              Text(
                '15',
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H4, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Text(
                Strings.TEXT_WISHLIST,
                style: TextStyle(color: CustomColors.secondaryTextColor),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget shipment() {
    return Container(
      padding: EdgeInsets.only(bottom: Dimens.SPACE_20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Text(
                Strings.TEXT_DETAIL_SHIPMENT,
                style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimens.SPACE_15,
              ),
              Text(
                Strings.TEXT_SHIPPING_START + " \$2.00",
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    IconsSvg.LOCATION,
                    color: CustomColors.primaryColor,
                  ),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Text(
                    "Surabaya, Jawa Timur",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_NORMAL,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget spesification() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.TEXT_SPESIFICATIONS,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_VOLTAGE,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "220 V",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_FREQUENCY,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "50 Hz",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_INPUT_POWER,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "500 W",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_NO_LOAD,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "1700 r/min",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_PLANN_WIDTH,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "82 mm",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_PLANN_DEPTH,
                style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
              ),
              Text(
                "1 mm",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_NORMAL),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget description() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.TEXT_SPESIFICATIONS,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra augue arcu cras amet, diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra augue arcu cras amet, diam.',
            style: TextStyle(
                color: CustomColors.secondaryTextColor, wordSpacing: 2),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.TEXT_READ_MORE,
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
                SizedBox(
                  width: Dimens.SPACE_10,
                ),
                SvgPicture.asset(IconsSvg.ARROW_DOWN),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customerReviews() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.TEXT_SPESIFICATIONS,
            style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_H3, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CustomColors.primaryColor,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Text("4.5",
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Text(
                    ("(124 sold)"),
                    style: TextStyle(color: CustomColors.secondaryTextColor),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      Strings.TEXT_HOME_SEE_ALL,
                      style: TextStyle(color: CustomColors.primaryColor),
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
          SizedBox(
            height: Dimens.SPACE_20,
          ),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.only(
                      top: Dimens.SPACE_5, bottom: Dimens.SPACE_5),
                  child: comment(),
                );
              })
        ],
      ),
    );
  }

  Widget comment() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: Dimens.SPACE_20,
                    backgroundImage: AssetImage("assets/img/product.png"),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Text(
                    "Wade Warren",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SvgPicture.asset(
                IconsSvg.SECOND_MENU,
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          RatingBarIndicator(
            rating: 4.5,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: CustomColors.primaryColor,
            ),
            itemCount: 5,
            itemSize: 18.0,
            direction: Axis.horizontal,
          ),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
          Text('Barangnya bagus, Saya suka produknya! '),
          SizedBox(
            height: Dimens.SPACE_10,
          ),
        ],
      ),
    );
  }

  Widget similarProducts() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: Dimens.SPACE_DEFAULT_MARGIN_LR),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.TEXT_SIMILAR_PRODUCTS,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_H3,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.TEXT_HOME_SEE_ALL,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          _recomProduct()
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
          itemCount: _listProduct.length,
          itemBuilder: (context, i) {
            return Container(
                child: CardProduct(
              images:
                  'https://aldo.lumira.live/uploads/10847525_7a0227bc-7a82-4c79-aafe-e0728ab8435d_768_1280%20%281%29.jpg',
              title: _listProduct[i].name,
              price: _listProduct[i].price,
              review: _listProduct[i].review.toDouble(),
            ));
          }),
    );
  }
}
