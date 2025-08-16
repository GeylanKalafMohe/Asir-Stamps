class TripInfo {
  final String? purpose;
  final String? duration;
  final String? accommodationType;
  final String? accommodationPlace;
  final List<String> preferences;
  final List<String> plannedAttractions;
  final String transport;
  final String visitRepeat;
  final String budget;
  final List<String> heardAbout;
  final DateTime submittedAt;

  TripInfo({
    required this.purpose,
    required this.duration,
    required this.accommodationType,
    required this.accommodationPlace,
    this.preferences = const [],
    this.plannedAttractions = const [],
    required this.transport,
    required this.visitRepeat,
    required this.budget,
    this.heardAbout = const [],
    required this.submittedAt,
  });

  factory TripInfo.fromMap(Map<String, dynamic> map) {
    return TripInfo(
      purpose: map['purpose'],
      duration: map['duration'],
      accommodationType: map['accommodationType'],
      accommodationPlace: map['accommodationPlace'],
      preferences: List<String>.from(map['preferences'] ?? []),
      plannedAttractions: List<String>.from(map['plannedAttractions'] ?? []),
      transport: map['transport'],
      visitRepeat: map['visitRepeat'],
      budget: map['budget'],
      heardAbout: List<String>.from(map['heardAbout'] ?? []),
      submittedAt: DateTime.parse(map['submittedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'purpose': purpose,
      'duration': duration,
      'accommodationType': accommodationType,
      'accommodationPlace': accommodationPlace,
      'preferences': preferences,
      'plannedAttractions': plannedAttractions,
      'transport': transport,
      'visitRepeat': visitRepeat,
      'budget': budget,
      'heardAbout': heardAbout,
      'submittedAt': submittedAt.toIso8601String(),
    };
  }
}
