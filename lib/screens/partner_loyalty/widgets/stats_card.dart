import 'package:asir_stamps_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_fonts.dart';

class StatsCard extends StatefulWidget {
  final String number;
  final String? numberTrailing;
  final String? numberTrailingIcon;
  final String text;
  final String icon;

  const StatsCard({
    super.key,
    required this.number,
    required this.text,
    required this.icon,
    this.numberTrailing,
    this.numberTrailingIcon,
  });

  @override
  State<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
            top: 10,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF313770),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.number,
                          style: AppFonts.heading1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            fontSize: 64,
                          ),
                        ),
                        if (widget.numberTrailing != null ||
                            widget.numberTrailingIcon != null) ...[
                          SizedBox(width: 5),
                          if (widget.numberTrailing != null)
                            Text(
                              widget.numberTrailing!,
                              style: AppFonts.bodySmall.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          if (widget.numberTrailingIcon != null)
                            SvgPicture.asset(
                              widget.numberTrailingIcon!,
                              width: 40,
                            ),
                        ],
                      ],
                    ),
                    Text(
                      widget.text,
                      style: AppFonts.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4361EE).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white, // Color of the border
                    width: 0.5, // Width of the border (stroke)
                  ),
                ),
                child: SvgPicture.asset(widget.icon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
