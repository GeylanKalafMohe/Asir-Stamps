import 'package:asir_stamps_app/models/popular_place.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/popular_place_card.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/section_widget.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class PopularPlacesSection extends StatelessWidget {
  final List<PopularPlace> places;
  final String title;
  const PopularPlacesSection({
    super.key,
    required this.title,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: title,
      action: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          visualDensity: VisualDensity(vertical: -4), // Reduce vertical space
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Optional: tighter touch area
        ),
        child: Text(
          'اعرف أكثر',
          style: AppFonts.bodyTiny.copyWith(color: AppColors.textGrey),
        ),
      ),
      content: SizedBox(
        height: 270,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          padding: EdgeInsetsDirectional.only(start: 12, end: 12),
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemBuilder: (context, index) =>
              PopularPlaceCard(place: places[index], allPlaces: places),
        ),
      ),
    );
  }
}
