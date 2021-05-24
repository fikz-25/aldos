import 'dart:convert';

import 'package:aldo/model/request/product.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/detail_product_screen.dart/detail_product_screen.dart';
import 'package:aldo/screen/home/search/search_screen.dart';
import 'package:aldo/screen/home/shoppingCart/shopping_cart_screen.dart';
import 'package:aldo/widgets/card_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geolocation;
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List _product;
  List<Product> _listProduct = [];
  List imgList = [
    'assets/img/home_2.png',
    'assets/img/home_2.png',
    'assets/img/home_2.png'
  ];

  List firstImgList = [
    'assets/img/home_1.png',
    'assets/img/home_1.png',
    'assets/img/home_1.png',
    'assets/img/home_1.png',
    'assets/img/home_1.png'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String latitude, longitude, thisLocation;
  var loading = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getProduct();
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
    getUserLocation();
  }

  getUserLocation() async {
    final coordinates =
        new Coordinates(double.parse(latitude), double.parse(longitude));
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      thisLocation = ('${first.subAdminArea}, ${first.adminArea}');
    });
    return first;
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
        loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.primaryColor,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SearchScreen()));
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_10,
                      right: Dimens.SPACE_10,
                      top: Dimens.SPACE_5,
                      bottom: Dimens.SPACE_5),
                  decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.SPACE_5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icon/search.svg",
                          color: CustomColors.secondaryTextColor),
                      SizedBox(
                        width: Dimens.SPACE_10,
                      ),
                      Text(
                        Strings.TEXT_HOME_SEARCH,
                        style: TextStyle(
                            color: CustomColors.secondaryTextColor,
                            fontSize: Dimens.TEXT_SIZE_H4),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ShoppingCartScreen()));
                    },
                    child: SvgPicture.asset(
                      IconsSvg.CART,
                      color: CustomColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      IconsSvg.BELL,
                      color: CustomColors.whiteColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: Dimens.SPACE_10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    location(),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    firstSlider(),
                    SizedBox(
                      height: Dimens.SPACE_10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.SPACE_DEFAULT_MARGIN_LR),
                          child: _firstIndicator(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                          child: GestureDetector(
                            onTap: () => {},
                            child: Text(Strings.TEXT_HOME_SEE_ALL,
                                style: TextStyle(
                                    fontSize: Dimens.TEXT_SIZE_H5,
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: Dimens.SPACE_DEFAULT_MARGIN_LR),
                        child: Text(
                          Strings.TEXT_HOME_CATEGORIES,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H3,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    categories(),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: Dimens.SPACE_DEFAULT_MARGIN_LR),
                        child: Text(
                          Strings.TEXT_HOME_LATEST,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H3,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: Dimens.SPACE_20),
                    secondSlider(),
                    SizedBox(height: Dimens.SPACE_10),
                    _secIndicator(),
                    SizedBox(height: Dimens.SPACE_20),
                    Padding(
                        padding: EdgeInsets.only(
                            left: Dimens.SPACE_DEFAULT_MARGIN_LR),
                        child: Text(
                          Strings.TEXT_POPULAR_PRODUCTS,
                          style: TextStyle(
                              fontSize: Dimens.TEXT_SIZE_H3,
                              fontWeight: FontWeight.bold),
                        )),
                    listProduct()
                  ],
                ),
              ),
            ),
    );
  }

  Widget listProduct() {
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 0.9;
    final double itemWidth = size.width / 1;
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.SPACE_DEFAULT_MARGIN_LR,
          right: Dimens.SPACE_DEFAULT_MARGIN_LR),
      child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: new ScrollController(keepScrollOffset: false),
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(
              _listProduct.length,
              (index) => Container(
                    child: Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailProductScreen(
                                            products: _listProduct[index])));
                          },
                          child: CardProduct(
                            images:
                                'https://aldo.lumira.live/uploads/10847525_7a0227bc-7a82-4c79-aafe-e0728ab8435d_768_1280%20%281%29.jpg',
                            title: _listProduct[index].name,
                            price: _listProduct[index].price,
                            review: _listProduct[index].review.toDouble(),
                          )),
                    ),
                  ))),
    );
  }

  Widget location() {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.SPACE_DEFAULT_MARGIN_LR,
          right: Dimens.SPACE_DEFAULT_MARGIN_LR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(right: Dimens.SPACE_15),
                  child: SvgPicture.asset(IconsSvg.LOCATION),
                ),
              ),
              _lineRight(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(left: Dimens.SPACE_15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.TEXT_HOME_MY_LOCATION,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_NORMAL,
                          color: CustomColors.secondaryTextColor),
                    ),
                    SizedBox(height: Dimens.SPACE_5),
                    Text(
                      thisLocation == null ? '' : thisLocation,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_H4,
                          color: CustomColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(IconsSvg.ARROW_DOWN)
        ],
      ),
    );
  }

  Widget _lineRight() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: Dimens.SPACE_40,
      width: 3,
      decoration: BoxDecoration(
        color: CustomColors.lineColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget firstSlider() {
    return Container(
      child: CarouselSlider(
        height: 150,
        initialPage: 0,
        enlargeCenterPage: false,
        // autoPlay: false,
        reverse: false,
        enableInfiniteScroll: false,
        // autoPlayInterval: Duration(seconds: 2),
        // autoPlayAnimationDuration: Duration(milliseconds: 2000),
        // pauseAutoPlayOnTouch: Duration(seconds: 10),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: firstImgList.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(),
                child: Image.asset(
                  imgUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget categories() {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.SPACE_DEFAULT_MARGIN_LR,
          right: Dimens.SPACE_DEFAULT_MARGIN_LR),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimens.SPACE_15),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4.0,
                              )
                            ],
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10))),
                        child: SvgPicture.asset(
                          IconsSvg.MACHINERY,
                        )),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_TOOLS,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimens.SPACE_15),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4.0,
                              )
                            ],
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10))),
                        child: SvgPicture.asset(
                          IconsSvg.TOLLS,
                        )),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_TOOLS,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.DRILL),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_DRILL,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.LIFTING),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_LIFTING,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.SPACE_15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.GRINDING),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_GRIDING,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.HARDWARE),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_HARDWARE,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.SANITARY),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_SANITARY,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.SPACE_15,
              ),
              GestureDetector(
                onTap: () {
                  _allCategories();
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimens.SPACE_15),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            )
                          ],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset(IconsSvg.SANITARY),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_5,
                    ),
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxWidth: 70.0,
                      ),
                      child: Text(
                        Strings.TEXT_HOME_SEE_ALL,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget secondSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CarouselSlider(
            height: 120.0,
            initialPage: 0,
            enlargeCenterPage: false,
            // autoPlay: false,
            reverse: false,
            enableInfiniteScroll: false,
            // autoPlayInterval: Duration(seconds: 2),
            // autoPlayAnimationDuration: Duration(milliseconds: 2000),
            // pauseAutoPlayOnTouch: Duration(seconds: 10),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _firstIndicator() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(firstImgList, (index, url) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: Dimens.SPACE_10,
            width: _current == index ? Dimens.SPACE_20 : Dimens.SPACE_10,
            decoration: BoxDecoration(
                color: _current == index
                    ? CustomColors.primaryColor
                    : Colors.grey[300],
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.SPACE_40))),
          );
        }),
      ),
    );
  }

  Widget _secIndicator() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(imgList, (index, url) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: Dimens.SPACE_10,
            width: _current == index ? Dimens.SPACE_20 : Dimens.SPACE_10,
            decoration: BoxDecoration(
                color: _current == index
                    ? CustomColors.primaryColor
                    : Colors.grey[300],
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.SPACE_40))),
          );
        }),
      ),
    );
  }

  Widget _lineBottom() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 6,
      width: 120,
      decoration: BoxDecoration(
        color: CustomColors.formBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  void _allCategories() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(Dimens.ROUNDED_CORNER),
                    topRight: const Radius.circular(Dimens.ROUNDED_CORNER),
                  )),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                    right: Dimens.SPACE_DEFAULT_MARGIN_LR,
                    top: Dimens.SPACE_30),
                child: Column(
                  children: [
                    Center(
                      child: _lineBottom(),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_30,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TEXT_HOME_CATEGORIES,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H3,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimens.SPACE_20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.MACHINERY),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  minWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_MACHINERY,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.TOLLS),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_TOOLS,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.DRILL),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_DRILL,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.LIFTING),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_LIFTING,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.GRINDING),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_GRIDING,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.HARDWARE),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_HARDWARE,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.SANITARY),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_SANITARY,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.SPACE_15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: Dimens.SPACE_70,
                                height: Dimens.SPACE_70,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(10))),
                                child: SvgPicture.asset(IconsSvg.OTHERS),
                              ),
                              SizedBox(
                                height: Dimens.SPACE_5,
                              ),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxWidth: 70.0,
                                ),
                                child: Text(
                                  Strings.TEXT_HOME_OTHERS,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.SPACE_15,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  width: Dimens.SPACE_70,
                                  height: Dimens.SPACE_70,
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4.0,
                                        )
                                      ],
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(10))),
                                  child: SvgPicture.asset(IconsSvg.SPAREPART),
                                ),
                                SizedBox(
                                  height: Dimens.SPACE_5,
                                ),
                                ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    maxWidth: 70.0,
                                  ),
                                  child: Text(
                                    Strings.TEXT_HOME_SPARE,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
