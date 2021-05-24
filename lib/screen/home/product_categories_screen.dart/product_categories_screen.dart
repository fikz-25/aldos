import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/card_product.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Machinery",
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
          padding: EdgeInsets.only(top: Dimens.SPACE_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.SPACE_20, right: Dimens.SPACE_20),
                child: Text(
                  "112 " + Strings.TEXT_PRODUCTS,
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_H3,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_15,
              ),
              listProduct()
            ],
          ),
        ),
      ),
    );
  }

  Widget listProduct() {
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 1.8;
    final double itemWidth = size.width / 2;
    return Container(
      padding: EdgeInsets.only(left: Dimens.SPACE_20, right: Dimens.SPACE_20),
      child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: new ScrollController(keepScrollOffset: false),
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(
              4,
              (index) => Container(
                    child: Center(
                      child: CardProduct(),
                    ),
                  ))),
    );
  }
}
