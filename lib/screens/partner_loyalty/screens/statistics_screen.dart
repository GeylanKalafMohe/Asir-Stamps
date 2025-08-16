import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_fonts.dart';

class PartnerStatisticsScreen extends StatelessWidget {
  const PartnerStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الإحصائيات',
          style: AppFonts.heading3.copyWith(
            color: const Color(0xFF19254F),
            fontWeight: AppFonts.bold,
          ),
        ),
        actions: [
          TextButton(
            child: Image.asset(AppIcons.excel, width: 20),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تحميل ملفات Excel...'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Graph Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Section Divider
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF19254F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'عدد القسائم للسنة الأخيرة:',
                      style: AppFonts.heading3.copyWith(
                        color: Colors.white,
                        fontWeight: AppFonts.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),
                  // SVG Graph
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SvgPicture.asset(
                          AppImages.partnerAnalyticsGraph,
                          height: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem('عدد المستخدمين', Colors.blue),
                      const SizedBox(width: 24),
                      _buildLegendItem('عدد القسائم', Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Section Divider
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF19254F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'احصائيات الشريك:',
                style: AppFonts.heading3.copyWith(
                  color: Colors.white,
                  fontWeight: AppFonts.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),

            // Statistics Cards
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _getStatCards().length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.only(
                      right: index == 0 ? 0 : 16,
                      left: index == _getStatCards().length - 1 ? 0 : 16,
                    ),
                    child: SvgPicture.asset(
                      _getStatCards()[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppFonts.bodySmall.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  List<String> _getStatCards() {
    return [
      AppImages.partnerAnalyticsDetails1,
      AppImages.partnerAnalyticsDetails2,
      AppImages.partnerAnalyticsDetails3,
      AppImages.partnerAnalyticsDetails4,
    ];
  }
}
