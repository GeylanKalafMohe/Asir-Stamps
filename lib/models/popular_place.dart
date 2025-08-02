import 'package:latlong2/latlong.dart';

class PopularPlace {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final String location;
  final String description;
  final String workingHours;
  final int requiredStamps;
  final int collectedStamps;
  final List<String> similarPlaces;
  bool isBookmarked;
  final String? googleMapsLink;
  final String? entryFee;
  final String stampType; // 'gold', 'silver', 'bronze'
  final LatLng coordinates;

  PopularPlace({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.description,
    required this.workingHours,
    required this.requiredStamps,
    this.collectedStamps = 0,
    this.similarPlaces = const [],
    this.isBookmarked = false,
    this.googleMapsLink,
    this.entryFee,
    required this.stampType,
    required this.coordinates,
  });
}
