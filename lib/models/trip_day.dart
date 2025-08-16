import 'dart:convert';

import 'package:intl/intl.dart';

class TripDay {
  final DateTime date;
  final List<String> places;

  TripDay({required this.date, this.places = const []});

  TripDay copyWith({DateTime? date, List<String>? places}) {
    return TripDay(date: date ?? this.date, places: places ?? this.places);
  }

  Map<String, dynamic> toMap() {
    return {'date': date.millisecondsSinceEpoch, 'places': places};
  }

  factory TripDay.fromMap(Map<String, dynamic> map) {
    return TripDay(
      date: DateFormat('dd/MM/yyyy').parse(map['date']),
      places: List<String>.from(map['places']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TripDay.fromJson(String source) =>
      TripDay.fromMap(json.decode(source));
}
