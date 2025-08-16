import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';

class CouponEntryCard extends StatefulWidget {
  final int index;
  final Function(int, Map<String, dynamic>) onDataChanged;
  final VoidCallback? onRemove;

  const CouponEntryCard({
    super.key,
    required this.index,
    required this.onDataChanged,
    this.onRemove,
  });

  @override
  State<CouponEntryCard> createState() => _CouponEntryCardState();
}

class _CouponEntryCardState extends State<CouponEntryCard> {
  final _discountController = TextEditingController();
  double _couponsCount = 50;
  double _validDays = 7;

  @override
  void initState() {
    super.initState();
    _discountController.text = '20';
    _updateData();
  }

  void _updateData() {
    final data = {
      'discount': int.tryParse(_discountController.text) ?? 0,
      'quantity': _couponsCount.toInt(),
      'valid_days': _validDays.toInt(),
    };
    widget.onDataChanged(widget.index, data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with discount input
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '%',
                          style: AppFonts.heading1.copyWith(
                            color: AppColors.primary,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: _discountController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: AppFonts.heading1.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppFonts.bold,
                              fontSize: 80,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: (value) => _updateData(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'أدخل قيمة الخصم',
                        style: AppFonts.bodyMedium.copyWith(
                          color: Colors.grey[700],
                          fontWeight: AppFonts.medium,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Coupons count slider
                Text(
                  'عدد القسائم للعملاء',
                  style: AppFonts.bodyMedium.copyWith(
                    color: Colors.grey[700],
                    fontWeight: AppFonts.medium,
                  ),
                ),
                const SizedBox(height: 8),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: CustomSliderThumb(
                      text: '${_couponsCount.toInt()}',
                    ),
                    trackHeight: 4,
                    overlayShape: SliderComponentShape.noOverlay,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Slider(
                    value: _couponsCount,
                    min: 5,
                    max: 500,
                    divisions: 99,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        _couponsCount = value;
                      });
                      _updateData();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '5',
                        style: AppFonts.bodySmall.copyWith(color: Colors.grey),
                      ),
                      Text(
                        '500',
                        style: AppFonts.bodySmall.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Valid days slider
                Text(
                  'عدد الأيام المتاحة للقسائم',
                  style: AppFonts.bodyMedium.copyWith(
                    color: Colors.grey[700],
                    fontWeight: AppFonts.medium,
                  ),
                ),
                const SizedBox(height: 8),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: CustomSliderThumb(
                      text: '${_validDays.toInt()}',
                    ),
                    trackHeight: 4,
                    overlayShape: SliderComponentShape.noOverlay,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Slider(
                    value: _validDays,
                    min: 1,
                    max: 30,
                    divisions: 29,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        _validDays = value;
                      });
                      _updateData();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1',
                        style: AppFonts.bodySmall.copyWith(color: Colors.grey),
                      ),
                      Text(
                        '30',
                        style: AppFonts.bodySmall.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Close button positioned at top start
          if (widget.onRemove != null)
            PositionedDirectional(
              top: 0,
              start: 0,
              child: IconButton(
                onPressed: widget.onRemove,
                icon: const Icon(Icons.close, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }
}

class CustomSliderThumb extends SliderComponentShape {
  final String text;

  CustomSliderThumb({required this.text});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(40, 40);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Draw circle
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? AppColors.primary
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 20, paint);

    // Draw text
    final textSpan = TextSpan(
      text: text,
      style: AppFonts.bodySmall.copyWith(
        color: Colors.white,
        fontWeight: AppFonts.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }
}
