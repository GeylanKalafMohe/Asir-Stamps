import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/user_info.dart';
import '../../utils/app_images.dart';
import '../trip_planner/trip_planner_screen.dart';
import 'widgets/asir_map.dart';
import 'widgets/discover_top_bar.dart';

class DiscoverAseerScreen extends StatelessWidget {
  const DiscoverAseerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = UserInfo(
      name: 'بكر شاهر',
      location: 'عسير، أبها',
      profileImage: AppImages.dummyProfile,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100 + MediaQuery.paddingOf(context).top),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            child: DiscoverTopBar(userInfo: userInfo),
          ),
        ),
      ),
      body: AsirMap(places: popularPlaces),
    );
  }
}
