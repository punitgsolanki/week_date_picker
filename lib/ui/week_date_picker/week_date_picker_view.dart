import 'package:flutter/material.dart';

import '../../week_date_picker.dart';
import 'widgets/date_button_view.dart';

/// You can set a week date picker and scroll between weeks.
class WeekDatePickerView extends StatefulWidget {
  const WeekDatePickerView({Key? key, required this.config, required this.changeDay, required this.selectedDay}) : super(key: key);

  final WeekDataPickerConfig config;

  /// Callback function with the new selected date
  final Function(DateTime) changeDay;

  /// Set the DateTime with current selected date
  final DateTime selectedDay;

  @override
  State<WeekDatePickerView> createState() => _WeekDatePickerViewState();
}

class _WeekDatePickerViewState extends State<WeekDatePickerView> {
  final DateTime _todayDateTime = DateTime.now();

  // About 100 years back in time should be sufficient for most users, 52 weeks * 100
  final int _weekIndexOffset = 5200;

  late final PageController _controller;
  late final DateTime _initialSelectedDay;

  final ValueNotifier<int> _weekNumber = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    AppConst.appData = widget.config;

    _controller = PageController(initialPage: _weekIndexOffset);
    _initialSelectedDay = widget.selectedDay;
    _weekNumber.value = widget.selectedDay.weekOfYear;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.appData.backgroundColor,
      child: Column(
        children: [
          AppConst.appData.weekPosition == WeekPosition.TOP ? _weekNumberView() : 0.sizeH,
          SizedBox(
            height: 64,
            child: Row(
              children: <Widget>[
                AppConst.appData.weekPosition == WeekPosition.LEFT ? _weekNumberView() : 0.sizeH,
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: _onPageChange,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, weekIndex) => _weekItem(weekIndex),
                  ),
                ),
                AppConst.appData.weekPosition == WeekPosition.RIGHT ? _weekNumberView() : 0.sizeH,
              ],
            ),
          ),
          AppConst.appData.weekPosition == WeekPosition.BOTTOM ? _weekNumberView() : 0.sizeH,
        ],
      ),
    );
  }

  _onPageChange(int index) {
    _weekNumber.value = _initialSelectedDay.add(Duration(days: 7 * (index - _weekIndexOffset))).weekOfYear;
  }

  Widget _weekItem(int weekIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _weekdays(weekIndex - _weekIndexOffset, widget.changeDay),
    );
  }

  Widget _weekNumberView() {
    double topMargin = AppConst.appData.weekPosition == WeekPosition.TOP ? 16 : AppConst.appData.weekPosition == WeekPosition.BOTTOM ? 8 : 0;
    double bottomMargin = AppConst.appData.weekPosition == WeekPosition.BOTTOM ? 16 : AppConst.appData.weekPosition == WeekPosition.TOP ? 12 : 0;
    double leftMargin = AppConst.appData.weekPosition == WeekPosition.LEFT ? 0 : 8;
    double rightMargin = AppConst.appData.weekPosition == WeekPosition.RIGHT ? 0 : 8;

    double topPadding = 8;
    double bottomPadding = 8;
    double leftPadding = AppConst.appData.weekPosition == WeekPosition.RIGHT ? 16 : 8;
    double rightPadding = AppConst.appData.weekPosition == WeekPosition.LEFT ? 16 : 8;

    return AppConst.appData.enableWeekNumberText
        ? Container(
            padding: EdgeInsets.fromLTRB(leftPadding, topPadding, rightPadding, bottomPadding),
            margin: EdgeInsets.fromLTRB(leftMargin, topMargin, rightMargin, bottomMargin),
            decoration: decorationWeek(),
            child: ValueListenableBuilder(
              valueListenable: _weekNumber,
              builder: (BuildContext context, int value, Widget? child) {
                String weekDay = '${AppConst.appData.weekDayText} $value';
                return Text(
                  weekDay,
                  style: textStyleWeekNumber(),
                );
              },
            ),
          )
        : 0.sizeH;
  }

  // Builds a 7 day list of DateButtons
  List<Widget> _weekdays(int weekIndex, Function(DateTime p1) changeDay) {
    List<Widget> weekdays = [];

    for (int i = 0; i < 7; i++) {
      final int offset = i + 1 - _initialSelectedDay.weekday;
      final int daysToAdd = weekIndex * 7 + offset;
      final DateTime dateTime = _initialSelectedDay.add(Duration(days: daysToAdd));
      weekdays.add(DateButtonView(_todayDateTime, dateTime, changeDay, widget.selectedDay));
    }
    return weekdays;
  }
}
