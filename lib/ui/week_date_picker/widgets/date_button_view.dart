import 'package:flutter/material.dart';

import '../../../week_date_picker.dart';

class DateButtonView extends StatelessWidget {
  final DateTime todayDateTime;
  final DateTime dateTime;
  final Function(DateTime) changeDay;
  final DateTime selectedDay;

  const DateButtonView(this.todayDateTime, this.dateTime, this.changeDay, this.selectedDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = AppConst.appData.weekDayType == WeekDayType.TYPE_1
        ? AppConst.weekDay1
        : AppConst.appData.weekDayType == WeekDayType.TYPE_2
            ? AppConst.weekDay2
            : AppConst.weekDay3;

    final String weekday = weekDays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDateAs(selectedDay);

    return Expanded(
      child: GestureDetector(
        onTap: () => changeDay(dateTime),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  AppConst.appData.weekDayCapitalize ? weekday.toUpperCase() : weekday,
                  style: textStyleWeekDay(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                decoration: decorationDay(dateTime.isSameDateAs(todayDateTime)),
                child: CircleAvatar(
                  backgroundColor: isSelected ? AppConst.appData.selectedBackgroundColor : AppConst.appData.backgroundColor,
                  radius: 14.0,
                  child: Text(
                    '${dateTime.day}',
                    style: textStyleDay(isSelected),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
