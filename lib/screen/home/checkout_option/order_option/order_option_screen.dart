import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderOptionScren extends StatefulWidget {
  @override
  _OrderOptionScrenState createState() => _OrderOptionScrenState();
}

class _OrderOptionScrenState extends State<OrderOptionScren> {
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
            Strings.TEXT_ORDER_OPTION,
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
                salesOption(),
                SizedBox(
                  height: Dimens.SPACE_15,
                ),
                officeOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget salesOption() {
    return Container(
        child: ExpandablePanel(
      header: Row(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: Dimens.SPACE_5, bottom: Dimens.SPACE_5),
            decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.circular(Dimens.SPACE_5)),
            padding: EdgeInsets.all(Dimens.SPACE_5),
            child: SvgPicture.asset(
              IconsSvg.ORDER_BAG,
            ),
          ),
          SizedBox(
            width: Dimens.SPACE_10,
          ),
          Text(
            Strings.TEXT_BY_SALES,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimens.TEXT_SIZE_NORMAL),
          )
        ],
      ),
      expanded: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Galih Saputra",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
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
                Text(
                  "Samuel",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
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
                Text(
                  "Khoirul Anwar",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
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
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    ));
  }

  Widget officeOption() {
    return Container(
        child: ExpandablePanel(
      header: Row(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: Dimens.SPACE_5, bottom: Dimens.SPACE_5),
            decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.circular(Dimens.SPACE_5)),
            padding: EdgeInsets.all(Dimens.SPACE_5),
            child: SvgPicture.asset(
              IconsSvg.OFFICE,
            ),
          ),
          SizedBox(
            width: Dimens.SPACE_10,
          ),
          Text(
            Strings.TEXT_BY_OFFICE,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimens.TEXT_SIZE_NORMAL),
          )
        ],
      ),
      expanded: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PT. Permata",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                ),
                Radio(
                    value: 4,
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
                Text(
                  "PT. Pesada",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                ),
                Radio(
                    value: 5,
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
                Text(
                  "PT. Bineka",
                  style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL),
                ),
                Radio(
                    value: 6,
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
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    ));
  }
}
