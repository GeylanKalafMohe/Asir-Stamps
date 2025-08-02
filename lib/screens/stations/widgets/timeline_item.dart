import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/popular_place.dart';
import '../../../screens/place_detail/place_detail_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'dashed_line_painter.dart';

class TimelineItem extends StatelessWidget {
  final PopularPlace place;
  final int index;
  final bool isLast;
  final List<PopularPlace> allPlaces;

  const TimelineItem({
    super.key,
    required this.place,
    required this.index,
    required this.isLast,
    required this.allPlaces,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        // Card content
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlaceDetailScreen(place: place, allPlaces: allPlaces),
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: AppColors.textPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          place.image,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: AppColors.textGrey,
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(AppIcons.sandHour, height: 14),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                place.title,
                                style: AppFonts.bodyMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          place.workingHours,
                          style: AppFonts.bodySmall.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: AppColors.navbarBackground,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: AppFonts.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (!isLast)
              CustomPaint(
                size: const Size(2, 180),
                painter: DashedLinePainter(
                  color: index == 0
                      ? AppColors.primary
                      : AppColors.timelineLine,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
