import 'package:asir_stamps_app/screens/stations/stations_screen.dart';
import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:asir_stamps_app/viewmodels/ai_trip_planner_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../utils/app_fonts.dart';

class GeneratingPlanPopup extends StatefulWidget {
  final VoidCallback onCancel;

  const GeneratingPlanPopup({super.key, required this.onCancel});

  @override
  State<GeneratingPlanPopup> createState() => _GeneratingPlanPopupState();
}

class _GeneratingPlanPopupState extends State<GeneratingPlanPopup> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      genPlan();
    });
  }

  Future<void> genPlan() async {
    try {
      final aiViewModel = Provider.of<AiTripPlannerViewModel>(
        context,
        listen: false,
      );

      final plan = await aiViewModel.generateTripPlan();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم توليد الخطة بنجاح!'),
          backgroundColor: AppColors.primary,
        ),
      );

      // Close popup and navigate to stations screen
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StationsScreen(tripPlanList: plan),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء توليد الخطة! يرجى المحاولة مرة أخرى'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF4A75B5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF00BFFF), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Loading indicator
            const SpinKitCircle(color: Color(0xFF0C1E4F), size: 50),
            const SizedBox(height: 16),

            // Main title
            Text(
              'يتم توليد أفضل خطة سياحية لك',
              textAlign: TextAlign.center,
              style: AppFonts.heading3.copyWith(
                color: Colors.white,
                fontWeight: AppFonts.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Subtitle
            Text(
              'بناء على اهتماماتك، سيقوم الذكاء الاصطناعي بترتيب أفضل خطة زيارة لك!',
              textAlign: TextAlign.center,
              style: AppFonts.bodyMedium.copyWith(
                color: const Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(height: 24),

            // Cancel button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: widget.onCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E2E3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'إلغاء العملية',
                  style: AppFonts.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: AppFonts.medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
