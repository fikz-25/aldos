import 'package:aldo/resources/icons_png.dart';
import 'package:aldo/resources/icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:aldo/resources/colors.dart';
import 'package:aldo/resources/dimens.dart';
import 'package:aldo/resources/string_resources.dart';
import 'package:aldo/screen/home/tab/bloc/tab_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabSelector extends StatelessWidget {
  final TabState tabState;
  final Function(TabState) onSelected;

  const TabSelector({
    Key key,
    @required this.tabState,
    @required this.onSelected,
  }) : super(key: key);

  Image getTabIcon(TabState tab) {
    switch (tab) {
      case TabState.home:
        return Image.asset(
          IconsPng.TAB_HOME,
          color: tab == TabState.activities
              ? CustomColors.primaryColor
              : CustomColors.lineColor,
          width: Dimens.ICON_DEFAULT_SIZE,
        );
      case TabState.activities:
        return Image.asset(
          IconsPng.TAB_HOME,
          color: onSelected(tab) == TabState.activities
              ? CustomColors.primaryColor
              : CustomColors.lineColor,
          width: Dimens.ICON_DEFAULT_SIZE,
        );
      case TabState.chat:
        return Image.asset(
          IconsPng.TAB_HOME,
          color: tab == TabState.activities
              ? CustomColors.primaryColor
              : CustomColors.lineColor,
          width: Dimens.ICON_DEFAULT_SIZE,
        );
      case TabState.profile:
        return Image.asset(
          IconsPng.TAB_HOME,
          color: tab == TabState.activities
              ? CustomColors.primaryColor
              : CustomColors.lineColor,
          width: Dimens.ICON_DEFAULT_SIZE,
        );
    }
    return Image.asset(
      IconsPng.TAB_HOME,
      color: tab == TabState.activities
          ? CustomColors.primaryColor
          : CustomColors.lineColor,
      width: Dimens.ICON_DEFAULT_SIZE,
    );
  }

  String getTabTitle(TabState tab) {
    switch (tab) {
      case TabState.home:
        return Strings.TEXT_BOTTOM_BAR_TITLE_HOME;
      case TabState.activities:
        return Strings.TEXT_BOTTOM_BAR_TITLE_ACTIVITIES;
      case TabState.chat:
        return Strings.TEXT_BOTTOM_BAR_TITLE_CHAT;
      case TabState.profile:
        return Strings.TEXT_BOTTOM_BAR_TITLE_PROFILE;
    }
    return Strings.TEXT_BOTTOM_BAR_TITLE_HOME;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: CustomColors.primaryColor,
      backgroundColor: CustomColors.whiteColor,
      currentIndex: TabState.values.indexOf(tabState),
      onTap: (index) => onSelected(TabState.values[index]),
      items: TabState.values.map((tab) {
        return BottomNavigationBarItem(
            icon: getTabIcon(tab), title: Text(getTabTitle(tab)));
      }).toList(),
    );
  }
}
