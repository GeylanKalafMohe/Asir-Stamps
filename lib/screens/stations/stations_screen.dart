import 'package:asir_stamps_app/screens/trip_planner/trip_planner_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/trip_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'widgets/timeline_item.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TripService _tripService = TripService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tripService.tripDays.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              setState(() {
                _tripService.addDay();
                _tabController.dispose();
                _tabController = TabController(
                  length: _tripService.tripDays.length,
                  vsync: this,
                );
              });
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
          preferredSize: const Size.fromHeight(48),
          child: TabBar(
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
            tabs: _tripService.tripDays.map((day) {
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
                        'اليوم ${day.dayNumber}',
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
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tripService.tripDays.map((day) {
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
                        place: day.places[index],
                        index: index,
                        isLast: index == day.places.length - 1,
                        allPlaces: popularPlaces,
                      ),
                    );
                  },
                );
        }).toList(),
      ),
    );
  }
}
