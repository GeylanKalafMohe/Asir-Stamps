import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/coupon_viewmodel.dart';
import 'coupon_info_card.dart';

class CouponsCarousel extends StatefulWidget {
  const CouponsCarousel({super.key});

  @override
  State<CouponsCarousel> createState() => _CouponsCarouselState();
}

class _CouponsCarouselState extends State<CouponsCarousel> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CouponViewModel>(
      builder: (context, couponViewModel, child) {
        final coupons = couponViewModel.coupons;

        if (coupons.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 230,
          child: Stack(
            children: [
              // Carousel
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  couponViewModel.setCurrentIndex(index);
                },
                itemCount: coupons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CouponInfoCard(couponData: coupons[index]),
                  );
                },
              ),

              // Page indicator (only show if more than 1 coupon)
              if (coupons.length > 1)
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      coupons.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: couponViewModel.currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
