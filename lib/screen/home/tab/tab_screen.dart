import 'dart:async';
import 'dart:io';

import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/activities/activities_screen.dart';
import 'package:aldo/screen/home/chat/chat_screen.dart';
import 'package:aldo/screen/home/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aldo/screen/home/home/home_screen.dart';
import 'package:aldo/screen/home/tab/bloc/tab_bloc.dart';
import 'package:aldo/screen/home/tab/bloc/tab_event.dart';
import 'package:aldo/screen/home/tab/bloc/tab_state.dart';
import 'package:aldo/screen/home/tab/tab_selector.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> with WidgetsBindingObserver {
  final TabBloc _tabBloc = TabBloc();
  Uri deepLink;
  Timer _timerLink;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }
    super.dispose();
  }

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    ActivitiesScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  Widget currentScreen = HomeScreen();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _tabBloc,
        builder: (BuildContext context, TabState tabState) {
          return Scaffold(
            body: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                  ),
                ],
              ),
              child: BottomAppBar(
                color: Colors.white,
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimens.SPACE_DEFAULT_MARGIN_LR,
                      right: Dimens.SPACE_DEFAULT_MARGIN_LR),
                  height: Dimens.SPACE_60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                HomeScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              IconsSvg.BAR_HOME,
                              width: Dimens.ICON_DEFAULT_SIZE,
                              color: currentTab == 0
                                  ? CustomColors.primaryColor
                                  : CustomColors.lineColor,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Strings.TEXT_BOTTOM_BAR_TITLE_HOME,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_NORMAL,
                                color: currentTab == 0
                                    ? CustomColors.primaryColor
                                    : CustomColors.lineColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            // currentScreen =
                            //     ActivitiesScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              IconsSvg.BAR_ACTIVITY,
                              width: Dimens.ICON_DEFAULT_SIZE,
                              color: currentTab == 1
                                  ? CustomColors.primaryColor
                                  : CustomColors.lineColor,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Strings.TEXT_BOTTOM_BAR_TITLE_ACTIVITIES,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_NORMAL,
                                color: currentTab == 1
                                    ? CustomColors.primaryColor
                                    : CustomColors.lineColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                ChatScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              IconsSvg.BAR_CHAT,
                              width: Dimens.ICON_DEFAULT_SIZE,
                              color: currentTab == 2
                                  ? CustomColors.primaryColor
                                  : CustomColors.lineColor,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Strings.TEXT_BOTTOM_BAR_TITLE_CHAT,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_NORMAL,
                                color: currentTab == 2
                                    ? CustomColors.primaryColor
                                    : CustomColors.lineColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                ProfileScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              IconsSvg.BAR_PROFILE,
                              width: Dimens.ICON_DEFAULT_SIZE,
                              color: currentTab == 3
                                  ? CustomColors.primaryColor
                                  : CustomColors.lineColor,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Strings.TEXT_BOTTOM_BAR_TITLE_PROFILE,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_NORMAL,
                                color: currentTab == 3
                                    ? CustomColors.primaryColor
                                    : CustomColors.lineColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
