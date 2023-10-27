/// Set week day name with different type
///
/// There are four predefine types:
///
/// WeekDayType.TYPE_1 = ['M', 'T', 'W', 'T', 'F', 'S', 'S']
///
/// WeekDayType.TYPE_2 = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
///
/// WeekDayType.TYPE_3 = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

enum WeekDayType {
  /// ['M', 'T', 'W', 'T', 'F', 'S', 'S']
  TYPE_1,
  /// ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
  TYPE_2,
  /// ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  TYPE_3
}