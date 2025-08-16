import 'package:flutter/foundation.dart';
import '../models/popular_place.dart';
import '../models/trip_day.dart';

class TripViewModel extends ChangeNotifier {
  final List<TripDay> _tripDays = [
    TripDay(date: DateTime.now(), places: []),
    TripDay(date: DateTime.now().add(Duration(days: 1)), places: []),
    TripDay(date: DateTime.now().add(Duration(days: 2)), places: []),
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
      places: [..._tripDays[dayIndex].places, place.id],
    );
    notifyListeners();
  }

  void removePlaceFromTrip(String placeId) {
    for (int i = 0; i < _tripDays.length; i++) {
      final places = _tripDays[i].places
          .where((pId) => pId != placeId)
          .toList();
      _tripDays[i] = _tripDays[i].copyWith(places: places);
    }
    notifyListeners();
  }

  void addDay() {
    final newDate = DateTime.now().add(Duration(days: _tripDays.length));
    _tripDays.add(TripDay(date: newDate, places: []));
    notifyListeners();
  }

  void updateTripDays(List<TripDay> newTripDays) {
    _tripDays.clear();
    _tripDays.addAll(newTripDays);
    notifyListeners();
  }

  void setPlacesForDay(int dayIndex, List<String> placeIds) {
    if (dayIndex >= 0 && dayIndex < _tripDays.length) {
      _tripDays[dayIndex] = _tripDays[dayIndex].copyWith(places: placeIds);
      notifyListeners();
    }
  }
}