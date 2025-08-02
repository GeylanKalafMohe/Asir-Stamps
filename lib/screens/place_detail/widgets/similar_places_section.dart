import 'package:asir_stamps_app/screens/place_detail/place_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/popular_place.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class SimilarPlacesSection extends StatelessWidget {
  final List<String> similarPlaceIds;
  final List<PopularPlace> allPlaces;

  const SimilarPlacesSection({
    super.key,
    required this.similarPlaceIds,
    required this.allPlaces,
  });

  @override
  Widget build(BuildContext context) {
    if (similarPlaceIds.isEmpty) return const SizedBox.shrink();

    final similarPlaces = similarPlaceIds
        .map((id) => allPlaces.firstWhere((place) => place.id == id))
        .toList();

    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أماكن مشابهة بنفس الطابع الحماسي:',
            style: AppFonts.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...similarPlaces.map(
            (place) => _buildSimilarPlaceItem(context, place),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarPlaceItem(BuildContext context, PopularPlace place) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              place.image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          place.title,
          style: AppFonts.bodyMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlaceDetailScreen(place: place, allPlaces: allPlaces),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'رؤية المزيد',
              style: AppFonts.bodyMedium.copyWith(color: AppColors.textGrey),
            ),
          ),
        ),
      ],
    );
  }
}
