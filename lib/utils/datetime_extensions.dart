extension DateTimeExtensions on DateTime {
  /// Returns the current date with time set to 00:00:00.000
  static DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// Returns this DateTime with time set to 00:00:00.000
  DateTime get dateOnly {
    return DateTime(year, month, day);
  }
}