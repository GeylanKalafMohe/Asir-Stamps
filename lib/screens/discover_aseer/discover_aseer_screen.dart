import 'package:asir_stamps_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../trip_planner/trip_planner_screen.dart';
import 'widgets/asir_map.dart';
import 'widgets/discover_top_bar.dart';

class DiscoverAseerScreen extends StatelessWidget {
  const DiscoverAseerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          150 + MediaQuery.of(context).padding.top,
        ),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              child: DiscoverTopBar(
                userInfo: userInfo,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اكتشف أماكن الأختام القريبة منك!',
                            style: AppFonts.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'تذكر، الأختام الذهبية تملك النقاط الأعلى!',
                            style: AppFonts.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.map,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: AsirMap(
        places: popularPlaces.where((e) => e.coordinates != null).toList(),
      ),
    );
  }
}
