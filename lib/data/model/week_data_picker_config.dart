import 'package:flutter/material.dart';

import '../../config/config.dart';

class WeekDataPickerConfig {
  /// Specifies the weekday text: default is 'Week'
  final String weekDayText;

  /// Specifies the weekday type which you want to display in date picker: Default is WeekDayType.TYPE_2
  ///
  /// You can set using below values:
  ///
  /// WeekDayType.TYPE_1, WeekDayType.TYPE_2, WeekDayType.TYPE_3
  final WeekDayType weekDayType;

  /// Set week name as capitalize by setting true: Default value is false
  final bool weekDayCapitalize;

  /// Set the background color
  final Color backgroundColor;

  /// Color of the selected digits text
  final Color selectedBackgroundColor;

  /// Color of the unselected digits text
  final Color selectedDigitColor;

  /// Color of the unselected digits text
  final Color digitsColor;

  /// Set the color of the week days 'Mon', 'Tue'...
  final Color weekDayTextColor;

  /// Set to false to hide the week number text field: Default value is true
  final bool enableWeekNumberText;

  /// Set to true to show the month text field: Default value is false
  final bool enableMonthText;

  /// Color of the weekday container
  final Color weekNumberColor;

  /// Color of the weekday text
  final Color weekNumberTextColor;

  /// Specifies the position of week number position: Default value is WeekPosition.LEFT
  ///
  /// You can set using below values:
  ///
  /// WeekPosition.LEFT , WeekPosition.RIGHT , WeekPosition.TOP , WeekPosition.BOTTOM
  final WeekPosition weekPosition;

  WeekDataPickerConfig({
    this.weekDayText = 'Week',
    this.weekDayType = WeekDayType.TYPE_2,
    this.weekDayCapitalize = false,
    this.backgroundColor = const Color(0xFFFAFAFA),
    this.selectedBackgroundColor = const Color(0xFF2A2859),
    this.selectedDigitColor = const Color(0xFFFFFFFF),
    this.digitsColor = const Color(0xFF000000),
    this.weekDayTextColor = const Color(0xFF303030),
    this.enableWeekNumberText = true,
    this.enableMonthText = false,
    this.weekNumberColor = const Color(0xFFB2F5FE),
    this.weekNumberTextColor = const Color(0xFF000000),
    this.weekPosition = WeekPosition.LEFT
  });
}
