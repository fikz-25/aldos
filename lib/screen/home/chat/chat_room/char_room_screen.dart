import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Dimens.SPACE_30,
                    child: Material(
                      child: Image.asset(
                        "assets/img/product.png",
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.SPACE_5)),
                      clipBehavior: Clip.hardEdge,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.SPACE_10,
                  ),
                  Text(
                    "AL-PLANER 1900 NEW",
                    style: TextStyle(color: CustomColors.black),
                  ),
                ],
              ),
              SvgPicture.asset(
                IconsSvg.SECOND_MENU,
              ),
            ],
          )),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(""), inputText()],
        ),
      ),
    );
  }

  Widget inputText() {
    return Container(
      color: CustomColors.whiteColor,
      padding: EdgeInsets.all(Dimens.SPACE_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.ROUNDED_CARDVIEW),
                )),
            child: TextField(
              autofocus: false,
              style: TextStyle(
                  fontSize: Dimens.TEXT_SIZE_NORMAL,
                  color: CustomColors.primaryTextColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.whiteColor,
                hintText: Strings.TEXT_CHANGE_EMAIL_REQUEST,
                contentPadding: const EdgeInsets.all(Dimens.SPACE_10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.SPACE_10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.SPACE_10),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimens.SPACE_15),
            decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.ROUNDED_CARDVIEW),
                )),
            child: SvgPicture.asset(
              IconsSvg.SEND,
              color: CustomColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
