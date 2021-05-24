import 'dart:convert';

import 'package:aldo/model/request/product.dart';
import 'package:aldo/network/service/network_service.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/detail_product_screen.dart/detail_product_screen.dart';
import 'package:aldo/widgets/card_product.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List _product;
  List<Product> _listProduct = [];
  var loading = false;

  Future<void> _getProduct() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(ServiceApi.search + _searchController.text);
    final datas = jsonDecode(response.body);
    setState(() {
      _product = datas['data'];
      print(_product);
      for (Map i in _product) {
        _listProduct.add(Product.fromJson(i));
        print(_listProduct);
        loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.primaryColor,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
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
                    InkWell(
                      onTap: () {
                        _getProduct();
                      },
                      child: SvgPicture.asset("assets/icon/search.svg",
                          color: CustomColors.secondaryTextColor),
                    ),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Container(
                        height: Dimens.SPACE_30,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: Strings.TEXT_HOME_SEARCH,
                              border: InputBorder.none),
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Strings.TEXT_CANCEL,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_NORMAL,
                      color: CustomColors.whiteColor),
                ),
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
              child: listProduct(),
            ),
    );
  }

  Widget listProduct() {
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 0.9;
    final double itemWidth = size.width / 1;
    return _product == null
        ? SizedBox()
        : Container(
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
                                              DetailProductScreen()));
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
}
