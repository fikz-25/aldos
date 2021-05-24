import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';

class HelpScrenn extends StatefulWidget {
  @override
  _HelpScrennState createState() => _HelpScrennState();
}

class _HelpScrennState extends State<HelpScrenn> {
  TextEditingController _searchController = TextEditingController();

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
            Strings.TEXT_HELP,
            style: TextStyle(color: CustomColors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: Dimens.SPACE_DEFAULT_MARGIN_LR,
              right: Dimens.SPACE_DEFAULT_MARGIN_LR),
          child: Column(
            children: [
              SizedBox(height: Dimens.SPACE_20),
              search(),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              faq()
            ],
          ),
        ),
      ),
    );
  }

  Widget search() {
    return Container(
        margin: EdgeInsets.only(top: Dimens.SPACE_5, bottom: Dimens.SPACE_5),
        decoration: BoxDecoration(
            color: CustomColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
              )
            ],
            borderRadius:
                BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
        child: TextFieldDefault(
          icons: IconsSvg.SEARCH,
          obscureText: false,
          isPassword: false,
          inputType: TextInputType.text,
          hintText: Strings.TEXT_HOME_SEARCH,
          controller: _searchController,
          onVisible: () {},
          validator: null,
        ));
  }

  Widget faq() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.SPACE_5, bottom: Dimens.SPACE_5),
      decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
            )
          ],
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 400),
            decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.ROUNDED_CARDVIEW),
                    topRight: Radius.circular(Dimens.ROUNDED_CARDVIEW))),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.SPACE_20),
              child: Text(
                "Lorem Ipsum dolor sit amet qua skuak?",
                style: TextStyle(
                    color: CustomColors.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.SPACE_20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus dui pretium malesuada nisl vitae. Ultrices in urna, arcu ultrices nunc accumsan. Volutpat risus dolor, ut sodales fusce.",
              style: TextStyle(color: CustomColors.primaryTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
