import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/widgets/text_field_defauld.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Container(
        padding: EdgeInsets.only(left: Dimens.SPACE_20, right: Dimens.SPACE_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimens.SPACE_20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                search(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconsSvg.CART,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimens.SPACE_20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconsSvg.BELL,
                        color: CustomColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: Dimens.SPACE_20,
            ),
            Expanded(child: _tabProfile())
          ],
        ),
      ),
    );
  }

  Widget search() {
    return Container(
        width: 250,
        margin: EdgeInsets.only(top: 1, bottom: 1),
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

  Widget _tabProfile() {
    return Container(
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: 'Panding'),
                Tab(text: 'Kemampuan'),
                Tab(text: 'Pengalaman'),
              ],
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 12.0),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                tabPanding(),
                tabPanding(),
                tabPanding(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget tabPanding() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 1.0, right: 1),
        child: _listPanding(),
      ),
    );
  }

  Widget _listPanding() {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 2,
          itemBuilder: (context, i) {
            return Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 3.0)
                    ],
                    borderRadius: new BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text("data")],
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
