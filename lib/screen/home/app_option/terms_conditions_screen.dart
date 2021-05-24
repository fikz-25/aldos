import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatefulWidget {
  @override
  _TermsConditionScreenState createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
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
            Strings.TEXT_REGISTER_TERMS_CONDITIONS,
            style: TextStyle(color: CustomColors.black),
          )),
      body: SingleChildScrollView(
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
              Center(
                child: Text(
                  Strings.TEXT_TEMPLATE.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_H3,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Container(child: Text(Strings.TEXT_TEMPLATE_2)),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("1."),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.TEXT_TEMPLATE),
                        SizedBox(
                          height: Dimens.SPACE_10,
                        ),
                        Container(
                          child: ConstrainedBox(
                            constraints: new BoxConstraints(
                              maxWidth: 340,
                            ),
                            child: Text(Strings.TEXT_TEMPLATE_3),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_10,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("2."),
                    SizedBox(
                      width: Dimens.SPACE_10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.TEXT_TEMPLATE),
                        SizedBox(
                          height: Dimens.SPACE_10,
                        ),
                        Container(
                          child: ConstrainedBox(
                            constraints: new BoxConstraints(
                              maxWidth: 340,
                            ),
                            child: Text(Strings.TEXT_TEMPLATE_3),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimens.SPACE_20,
              ),
              Container(child: Text(Strings.TEXT_TEMPLATE_2)),
              SizedBox(
                height: Dimens.SPACE_20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
