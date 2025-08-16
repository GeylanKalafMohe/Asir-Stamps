import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/popular_place.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../viewmodels/trip_viewmodel.dart';
import '../../place_detail/place_detail_screen.dart';

class PopularPlaceCard extends StatefulWidget {
  final PopularPlace place;
  final List<PopularPlace> allPlaces;

  const PopularPlaceCard({
    super.key,
    required this.place,
    this.allPlaces = const [],
  });

  @override
  State<PopularPlaceCard> createState() => _PopularPlaceCardState();
}

class _PopularPlaceCardState extends State<PopularPlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(
                place: widget.place,
                allPlaces: widget.allPlaces,
              ),
            ),
          );
        },
        child: Card(
          elevation: 5,
          color: AppColors.textPrimary,
          child: SizedBox(
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.place.id,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          widget.place.image,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.place.title,
                                style: AppFonts.bodyMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () => setState(
                                () => widget.place.isBookmarked =
                                    !widget.place.isBookmarked,
                              ),
                              icon: Icon(
                                widget.place.isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: AppColors.primary,
                              ),
                              padding: EdgeInsets.all(6),
                              visualDensity: VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.place.subtitle,
                          style: AppFonts.bodyTiny.copyWith(
                            color: AppColors.textGrey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final tripViewModel = Provider.of<TripViewModel>(
                                context,
                                listen: false,
                              );
                              tripViewModel.addPlaceToTrip(widget.place);
                              ScaffoldMessenger.of(
                                context,
                              ).removeCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم إضافة ${widget.place.title} إلى رحلتك!',
                                  ),
                                  backgroundColor: AppColors.primary,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppColors.textGrey,
                              backgroundColor: AppColors.navbarBackground,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'أضف للرحلة',
                              style: AppFonts.bodySmall.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
