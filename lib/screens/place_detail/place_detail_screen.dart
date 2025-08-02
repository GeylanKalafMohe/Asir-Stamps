import 'package:flutter/material.dart';

import '../../models/popular_place.dart';
import '../../services/trip_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'widgets/place_info_card.dart';
import 'widgets/similar_places_section.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PopularPlace place;
  final List<PopularPlace> allPlaces;

  const PlaceDetailScreen({
    super.key,
    required this.place,
    required this.allPlaces,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: place.id,
                child: Image.asset(
                  place.image,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                PlaceInfoCard(place: place),
                SimilarPlacesSection(
                  similarPlaceIds: place.similarPlaces,
                  allPlaces: allPlaces,
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      TripService().addPlaceToTrip(place);
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم إضافة ${place.title} إلى رحلتك!'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navbarBackground,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'أضف للرحلة!',
                      style: AppFonts.bodyLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
