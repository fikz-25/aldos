import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/chat/chat_room/char_room_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.TEXT_ALDO_CHAT,
                style: TextStyle(color: CustomColors.black),
              ),
              SvgPicture.asset(
                IconsSvg.SEARCH,
                color: CustomColors.black,
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: Dimens.SPACE_DEFAULT_MARGIN_LR,
              right: Dimens.SPACE_DEFAULT_MARGIN_LR),
          child: Column(
            children: [
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChatRoomScreen()));
                  },
                  child: listChat())
            ],
          ),
        ),
      ),
    );
  }

  Widget listChat() {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Dimens.SPACE_70,
          child: Material(
            child: Image.asset(
              "assets/img/product.png",
              fit: BoxFit.cover,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(Dimens.ROUNDED_CARDVIEW)),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        SizedBox(
          width: Dimens.SPACE_10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("AL-PLANER 1900 NEW",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H4,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black)),
                SizedBox(width: Dimens.SPACE_20),
                Text("Sel, 04/08/2020",
                    style: TextStyle(fontSize: Dimens.TEXT_SIZE_NORMAL))
              ],
            ),
            SizedBox(
              height: Dimens.SPACE_15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Halo kak, spesifikasinya...",
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H4,
                        color: CustomColors.secondaryTextColor)),
                SizedBox(width: Dimens.SPACE_80),
                SvgPicture.asset(
                  IconsSvg.CHECKLIST_1,
                  color: CustomColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
