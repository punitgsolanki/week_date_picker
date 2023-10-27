import 'package:flutter/material.dart';

import 'config.dart';

TextStyle textStyleDay(bool isSelected) {
  return TextStyle(fontSize: 16.0, color: isSelected ? AppConst.appData.selectedDigitColor : AppConst.appData.digitsColor);
}

TextStyle textStyleWeekDay() {
  return TextStyle(fontSize: 12.0, color: AppConst.appData.weekDayTextColor);
}

TextStyle textStyleWeekNumber() {
  return TextStyle(color: AppConst.appData.weekNumberTextColor);
}

BoxDecoration decorationDay(bool isSameDate) {
  return BoxDecoration(
      // Border around today's date
      color: isSameDate ? AppConst.appData.selectedBackgroundColor : Colors.transparent,
      shape: BoxShape.circle);
}

BoxDecoration decorationWeek() {
  late BorderRadiusGeometry borderRadiusGeometry;

  if (AppConst.appData.weekPosition == WeekPosition.LEFT) {
    borderRadiusGeometry = const BorderRadius.only(
      topRight: Radius.circular(40),
      bottomRight: Radius.circular(40),
    );
  } else if (AppConst.appData.weekPosition == WeekPosition.RIGHT) {
    borderRadiusGeometry = const BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomLeft: Radius.circular(40),
    );
  } else if (AppConst.appData.weekPosition == WeekPosition.TOP || AppConst.appData.weekPosition == WeekPosition.BOTTOM) {
    borderRadiusGeometry = const BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomLeft: Radius.circular(40),
      topRight: Radius.circular(40),
      bottomRight: Radius.circular(40),
    );
  } else {
    borderRadiusGeometry = const BorderRadius.all(Radius.circular(0));
  }

  return BoxDecoration(
    // Border around today's date
    color: AppConst.appData.weekNumberColor,
    borderRadius: borderRadiusGeometry,
  );
}
