import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardProduct extends StatelessWidget {
  final String title;
  final String price;
  final double review;
  final String images;

  const CardProduct(
      {Key key,
      @required this.title,
      @required this.price,
      @required this.review,
      @required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 330,
        margin: EdgeInsets.all(Dimens.SPACE_5),
        decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 3.0,
              )
            ],
            borderRadius:
                new BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              images,
              width: 170,
              height: 170,
            ),
            SizedBox(
              height: Dimens.SPACE_5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.SPACE_5, right: Dimens.SPACE_5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H5,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: Dimens.SPACE_5,
                  ),
                  Text(
                    "Machinery",
                    style: TextStyle(color: CustomColors.secondaryTextColor),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TEXT_RP + price,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H5,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          RatingBarIndicator(
                            rating: review,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Dimens.SPACE_20,
                      ),
                      // Image.asset(
                      //   "assets/icon/like.png",
                      // )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimens.SPACE_15,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimens.SPACE_10,
                  right: Dimens.SPACE_10,
                  bottom: Dimens.SPACE_10),
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomColors.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.SPACE_10))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(Dimens.SPACE_20,
                          Dimens.SPACE_10, Dimens.SPACE_20, Dimens.SPACE_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(IconsSvg.PRODUCT_BAG),
                          SizedBox(
                            width: Dimens.SPACE_5,
                          ),
                          Text(
                            Strings.TEXT_ORDER,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: CustomColors.whiteColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ));
  }
}
