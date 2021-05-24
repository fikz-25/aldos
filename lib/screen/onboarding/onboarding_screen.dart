import 'dart:io';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/auth/welcome_screen.dart';
import 'package:aldo/screen/home/home/home_screen.dart';
import 'package:aldo/screen/update_profile/update_address/update_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key key}) : super(key: key);
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: isCurrentPage ? 6 : 6,
      width: isCurrentPage ? 12 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  _handleNavigation() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackgroundColor,
      body: Container(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            _currentPage = page;
            setState(() {});
          },
          children: <Widget>[
            _buildPageContent(
                image: 'assets/img/onboarding_1.png',
                title: Strings.TEXT_TITLE_ONBOARDING_FIRST,
                body: Strings.TEXT_CONTEN_ONBOARDING_FIRST),
            _buildPageContent(
                image: 'assets/img/onboarding_2.png',
                title: Strings.TEXT_TITLE_ONBOARDING_FIRST,
                body: Strings.TEXT_CONTEN_ONBOARDING_FIRST),
            _buildPageContent(
                image: 'assets/img/onboarding_3.png',
                title: Strings.TEXT_TITLE_ONBOARDING_FIRST,
                body: Strings.TEXT_CONTEN_ONBOARDING_FIRST),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({
    String image,
    String title,
    String body,
  }) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 560.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < _totalPages; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false)
                      ]),
                ),
              ],
            ),
            SizedBox(height: Dimens.SPACE_30),
            Container(
              padding: EdgeInsets.only(
                  left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                  right: Dimens.SPACE_DEFAULT_MARGIN_LR),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_H2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimens.SPACE_10,
                  ),
                  Text(
                    body,
                    style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_H5,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimens.SPACE_30,
            ),
            _currentPage != 2
                ? Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            _pageController.animateToPage(_currentPage + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                            setState(() {});
                          },
                          child: Text(
                            Strings.TEXT_NEXT,
                            style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_H4,
                                color: CustomColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      _handleNavigation();
                    },
                    child: Container(
                      height: Platform.isIOS ? 70 : 60,
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: Dimens.TEXT_SIZE_H4,
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            SizedBox(
              height: Dimens.SPACE_40,
            )
          ],
        ),
      ),
    );
  }
}
