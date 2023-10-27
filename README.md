# Week Date Picker

A calendar picker with support for single date picker also you can scroll between weeks.

<img src="https://raw.githubusercontent.com/punitgsolanki/week_date_picker/main/assets/img_demo.png">

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