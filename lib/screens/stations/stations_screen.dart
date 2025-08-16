import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:asir_stamps_app/widgets/plan_created_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/trip_day.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../viewmodels/trip_viewmodel.dart';
import '../../widgets/generating_plan_popup.dart';
import 'widgets/timeline_item.dart';

class StationsScreen extends StatefulWidget {
  final List<TripDay>? tripPlanList;

  const StationsScreen({super.key, this.tripPlanList});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late List<TripDay> tripDays;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tripViewModel = Provider.of<TripViewModel>(context);
    tripDays = widget.tripPlanList ?? tripViewModel.tripDays;
    _tabController = TabController(length: tripDays.length, vsync: this);

    return Scaffold(
      backgroundColor: AppColors.timelineBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'جدولة الرحلة والوجهات',
          style: AppFonts.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: widget.tripPlanList != null
            ? null
            : IconButton(
                icon: SvgPicture.asset(AppIcons.ai),
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => GeneratingPlanPopup(
                      onCancel: () => Navigator.of(context).pop(),
                    ),
                  );
                },
              ),
        actions: widget.tripPlanList != null
            ? null
            : [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: () {
                    tripViewModel.addDay();
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تم إضافة يوم جديد إلى رحلتك!'),
                        backgroundColor: AppColors.primary,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            widget.tripPlanList != null ? 150 : 48,
          ),
          child: Column(
            children: [
              // Show banner if tripPlanList is provided
              if (widget.tripPlanList != null)
                PlanCreatedBanner(
                  onAccept: () {
                    tripViewModel.updateTripDays(widget.tripPlanList!);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم قبول الخطة بنجاح'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  onReject: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم رفض الخطة'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: AppFonts.bodyTiny.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey,
                ),
                unselectedLabelStyle: AppFonts.bodyTiny,
                indicatorColor: AppColors.navbarBackground,
                tabs: tripDays.asMap().entries.map((item) {
                  final day = item.value;
                  final formattedDate = DateFormat(
                    'd MMM yyyy',
                    'ar',
                  ).format(day.date);
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Tab(
                      child: Column(
                        children: [
                          Text(
                            'اليوم ${item.key + 1}',
                            style: AppFonts.bodyMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(formattedDate),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tripDays.map((day) {
          return day.places.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'لا توجد وجهات في هذا اليوم',
                        style: AppFonts.bodyMedium.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: day.places.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TimelineItem(
                        place: (popularPlaces + eventPlaces).firstWhere(
                          (p) => p.id == day.places[index],
                        ),
                        index: index,
                        isLast: index == day.places.length - 1,
                        allPlaces: (popularPlaces + eventPlaces),
                      ),
                    );
                  },
                );
        }).toList(),
      ),
    );
  }
}
