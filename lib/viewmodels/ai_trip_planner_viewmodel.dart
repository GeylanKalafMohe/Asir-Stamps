import 'dart:convert';

import 'package:asir_stamps_app/models/trip_day.dart';
import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:asir_stamps_app/utils/datetime_extensions.dart';
import 'package:collection/collection.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/foundation.dart';

import '../models/trip_info.dart';

class AiTripPlannerViewModel extends ChangeNotifier {
  bool _isGenerating = false;
  TripInfo? _tripInfo;

  bool get isGenerating => _isGenerating;
  TripInfo get tripInfo =>
      _tripInfo ??
      TripInfo(
        purpose: 'ترفيه',
        duration: '3 أيام',
        accommodationType: 'فندق',
        accommodationPlace: 'أبها',
        preferences: ['ثقافة وتراث', 'مشاهدة طبيعة'],
        plannedAttractions: [],
        transport: 'تأجير سيارات',
        visitRepeat: 'زائر أول',
        heardAbout: ['وسائل التواصل'],
        budget: 'أقل من 3,500 ريال',
        submittedAt: DateTime.now(),
      );

  Future<List<TripDay>> generateTripPlan() async {
    _isGenerating = true;
    notifyListeners();

    try {
      // Initialize the Gemini Developer API backend service

      // Create a `GenerativeModel` instance with a model that supports your use case
      final model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
      );

      final prompt =
          '''
      You are the travel planner for the Asir region in Saudi Arabia.
      These are the current travel places we support in our application:
      {
        "places": ${popularPlaces.map((e) => e.toMap()).toString()}
      }

      Please generate a personalized travel plan based on the user's information below:
      
      User Profile:
      Age: ${userInfo.age} years old
      Gender: ${userInfo.gender}
      Nationality: ${userInfo.nationality}
      
      Trip Information:
      Trip Purpose: ${tripInfo.purpose ?? 'Not specified'}
      Duration: ${tripInfo.duration ?? 'Not specified'}
      Accommodation Type: ${tripInfo.accommodationType ?? 'Not specified'}
      Accommodation Place: ${tripInfo.accommodationPlace ?? 'Not specified'}
      Interests & Preferences: ${tripInfo.preferences.join(', ')}
      Planned Attractions: ${tripInfo.plannedAttractions.isEmpty ? 'Not specified' : tripInfo.plannedAttractions.join(', ')}
      Preferred Transport: ${tripInfo.transport ?? 'Not specified'}
      Visit Type: ${tripInfo.visitRepeat ?? 'Not specified'}
      
      AI Instructions:
      Please make the plan as user specific as you can based on the provided places and the information you know about the places.
      Do not recommend the same place again on another day if you added it already to the trip plan.
      Make sure that the first trip day should be the following Date: ${DateTimeExtensions.today.day}/${DateTimeExtensions.today.month}/${DateTimeExtensions.today.year}

      Using ONLY this data, generate a personalized travel plan in JSON format.
      Do NOT include any text outside JSON.
      The JSON must be valid and parsable directly in Flutter.
      Respond in plain text only. Do not use Markdown, code blocks, or formatting symbols:
      {
        "days": [
          {
            "date": dd/MM/yyyy,
            "places": ["id1", "id2", "id3"]
          }
        ]
      }
      ''';
      print(prompt);

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      print(response.text);
      final planJson =
          jsonDecode(response.text ?? '{}') as Map<String, dynamic>;

      final daysList = planJson['days'] as List;
      final tripPlanList = daysList.map((e) => TripDay.fromMap(e)).toList();

      for (int dayIndex = 0; dayIndex < tripPlanList.length; dayIndex++) {
        final day = tripPlanList[dayIndex];
        for (
          int placeIndex = day.places.length - 1;
          placeIndex >= 0;
          placeIndex--
        ) {
          final dayPlaceId = day.places[placeIndex];
          if (popularPlaces.firstWhereOrNull((p) => p.id == dayPlaceId) ==
              null) {
            day.places.removeAt(placeIndex);
          }
        }
      }

      return tripPlanList;
    } catch (e) {
      print('حدث خطأ في توليد الخطة: ${e.toString()}');
      rethrow;
    } finally {
      _isGenerating = false;
      notifyListeners();
    }
  }

  void saveTripInfo(TripInfo tripInfo) {
    _tripInfo = tripInfo;
    notifyListeners();
  }
}
