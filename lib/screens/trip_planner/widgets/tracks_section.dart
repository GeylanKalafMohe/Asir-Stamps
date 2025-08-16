import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/section_widget.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:asir_stamps_app/viewmodels/navigation_viewmodel.dart';
import 'package:asir_stamps_app/viewmodels/trip_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TracksSection extends StatelessWidget {
  const TracksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'المسارات',
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // First row: Two buttons side by side
            Row(
              children: [
                Expanded(
                  child: buildTrackItem(
                    context,
                    AppIcons.heritage,
                    "مسار التراث",
                    'تراث',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildTrackItem(
                    context,
                    AppIcons.hiking,
                    "مسار التسلق",
                    'تسلق',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Second row: One centered button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: buildTrackItem(
                  context,
                  AppIcons.roadTrip,
                  "مسار عائلات",
                  'عائلات',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrackItem(
    BuildContext context,
    String assetName,
    String trackName,
    String category,
  ) {
    return InkWell(
      onTap: () {
        final tripViewModel = Provider.of<TripViewModel>(
          context,
          listen: false,
        );
        final filteredPlaces = popularPlaces
            .where((place) => place.categories.contains(category) == true)
            .map((place) => place.id)
            .toList();

        // Update first day with filtered places, clear other days
        tripViewModel.setPlacesForDay(0, filteredPlaces);
        for (int i = 1; i < tripViewModel.tripDays.length; i++) {
          tripViewModel.setPlacesForDay(i, []);
        }

        // Navigate to Stations screen (index 3)
        final navigationViewModel = Provider.of<NavigationViewModel>(
          context,
          listen: false,
        );
        navigationViewModel.setCurrentIndex(
          3,
        ); // Navigate to StationsScreen (index 3 in MainTabScreen)
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF7B84B1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetName, width: 24, height: 24),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                trackName,
                style: AppFonts.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
