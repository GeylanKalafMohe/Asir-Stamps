import '../models/popular_place.dart';
import '../models/trip_day.dart';

class TripService {
  static final TripService _instance = TripService._internal();
  factory TripService() => _instance;
  TripService._internal();

  final List<TripDay> _tripDays = [
    TripDay(dayNumber: 1, date: DateTime.now(), places: []),
    TripDay(
      dayNumber: 2,
      date: DateTime.now().add(Duration(days: 1)),
      places: [],
    ),
    TripDay(
      dayNumber: 3,
      date: DateTime.now().add(Duration(days: 2)),
      places: [],
    ),
  ];

  List<TripDay> get tripDays => List.unmodifiable(_tripDays);

  void addPlaceToTrip(PopularPlace place) {
    // Find first day with less than 3 places
    int dayIndex = 0;

    for (int i = 0; i < _tripDays.length; i++) {
      if (_tripDays[i].places.length < 3) {
        dayIndex = i;
        break;
      }
    }

    _tripDays[dayIndex] = _tripDays[dayIndex].copyWith(
      places: [..._tripDays[dayIndex].places, place],
    );
  }

  void removePlaceFromTrip(String placeId) {
    for (int i = 0; i < _tripDays.length; i++) {
      final places = _tripDays[i].places.where((p) => p.id != placeId).toList();
      _tripDays[i] = _tripDays[i].copyWith(places: places);
    }
  }

  void addDay() {
    final newDayNumber = _tripDays.length + 1;
    final newDate = DateTime.now().add(Duration(days: _tripDays.length));
    _tripDays.add(TripDay(dayNumber: newDayNumber, date: newDate, places: []));
  }
}
