# Week Date Picker

A calendar picker based on Flutter CalendarDatePicker, with support for single date picker.

<img src="https://drive.google.com/file/d/1pdidpHbV2_rbPx2_C6hWsXRopUAcbnsK/view?usp=sharing">

## Installing

To use this package, add `week_date_picker` as a dependency in your `pubspec.yaml` file.

## Usage

```dart
WeekDatePickerView(
    changeDay: (value) => setState(() {
        _selectedDay = value;
    }),
    selectedDay: _selectedDay,
    config: WeekDataPickerConfig(
        enableWeekNumberText: true,
        enableMonthText: true,
        weekDayType: WeekDayType.TYPE_3,
        weekPosition: WeekPosition.LEFT,
        weekDayCapitalize: true,
    ),
),
```

## How to use custom styling

You can use custom colors and labels by the optional parameters:

- `config` Specifies the WeekDataPickerConfig and set configuration of the WeekDatePickerView
- `selectedDay` Set the DateTime with current selected date
- `changeDay` Callback function with the new selected date