import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/auth/login/login_screen.dart';
import 'package:aldo/screen/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _navigatorLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext contex) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/img/logo.png'),
                      SizedBox(
                        height: Dimens.SPACE_10,
                      ),
                      Text(
                        Strings.TEXT_TITLE.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: CustomColors.whiteColor,
                            fontSize: Dimens.TEXT_SIZE_H1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Strings.TEXT_GET_STARTED_DEST,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: CustomColors.whiteColor),
                      ),
                      SizedBox(
                        height: Dimens.SPACE_20,
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/img/mesin_2.png',
                      width: 270,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: Column(
                          children: [
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                minWidth: 280,
                                onPressed: () {
                                  _navigatorLogin();
                                },
                                color: CustomColors.whiteColor,
                                child: Text(
                                  Strings.TEXT_LOGIN.toUpperCase(),
                                  style: TextStyle(
                                      color: CustomColors.primaryColor),
                                )),
                            SizedBox(
                              height: Dimens.SPACE_10,
                            ),
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: CustomColors.whiteColor)),
                                height: 40,
                                minWidth: 280,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext contex) =>
                                              RegisterScreen()));
                                },
                                color: CustomColors.primaryColor,
                                child: Text(
                                  Strings.TEXT_REGISTER.toUpperCase(),
                                  style:
                                      TextStyle(color: CustomColors.whiteColor),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimens.SPACE_60,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Center(
                    child: _lineBottom(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _lineBottom() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 6,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
