import 'package:asir_stamps_app/utils/datetime_extensions.dart';

class CouponData {
  final String discount;
  final int remainingCoupons;
  final String referralCode;
  final String restaurantName;
  final bool isActive;
  final DateTime startDate;
  final DateTime endDate;

  String get status => isActive ? 'فعال' : 'غير فعال';

  CouponData({
    required this.discount,
    required this.remainingCoupons,
    required this.referralCode,
    required this.restaurantName,
    required this.isActive,
    DateTime? startDate,
    required this.endDate,
  }) : startDate = startDate ?? DateTimeExtensions.today;

  CouponData copyWith({
    String? discount,
    int? remainingCoupons,
    String? referralCode,
    String? restaurantName,
    bool? isActive,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return CouponData(
      discount: discount ?? this.discount,
      remainingCoupons: remainingCoupons ?? this.remainingCoupons,
      referralCode: referralCode ?? this.referralCode,
      restaurantName: restaurantName ?? this.restaurantName,
      isActive: isActive ?? this.isActive,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discount': discount,
      'remainingCoupons': remainingCoupons,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'referralCode': referralCode,
      'restaurantName': restaurantName,
      'isActive': isActive,
    };
  }

  factory CouponData.fromMap(Map<String, dynamic> map) {
    return CouponData(
      discount: map['discount'] ?? '',
      remainingCoupons: map['remainingCoupons'] ?? 0,
      startDate: map['startDate'] != null
          ? DateTime.parse(map['startDate'])
          : null,
      endDate: DateTime.parse(map['endDate']),
      referralCode: map['referralCode'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }
}
