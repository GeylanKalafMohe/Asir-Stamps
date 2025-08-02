import 'popular_place.dart';

class TripDay {
  final int dayNumber;
  final DateTime date;
  final List<PopularPlace> places;

  TripDay({
    required this.dayNumber,
    required this.date,
    this.places = const [],
  });

  TripDay copyWith({
    int? dayNumber,
    DateTime? date,
    List<PopularPlace>? places,
  }) {
    return TripDay(
      dayNumber: dayNumber ?? this.dayNumber,
      date: date ?? this.date,
      places: places ?? this.places,
    );
  }
}