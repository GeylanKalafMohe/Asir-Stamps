import 'package:flutter/foundation.dart';

import '../models/coupon_data.dart';
import '../utils/datetime_extensions.dart';

class CouponViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  final List<CouponData> _coupons = [
    CouponData(
      discount: '20%',
      remainingCoupons: 16,
      referralCode: 'IP-SA-00001',
      restaurantName: 'مطعم شندل',
      isActive: true,
      endDate: DateTimeExtensions.today.add(const Duration(days: 14)),
    ),
    CouponData(
      discount: '15%',
      remainingCoupons: 25,
      referralCode: 'IP-SA-00002',
      restaurantName: 'مطعم شندل',
      isActive: true,
      endDate: DateTimeExtensions.today.add(const Duration(days: 5)),
    ),
    CouponData(
      discount: '25%',
      remainingCoupons: 10,
      referralCode: 'IP-SA-00003',
      restaurantName: 'مطعم شندل',
      isActive: false,
      endDate: DateTimeExtensions.today.add(const Duration(days: 30)),
    ),
  ];

  int get currentIndex => _currentIndex;
  CouponData get couponData => _coupons.isNotEmpty
      ? _coupons[_currentIndex]
      : CouponData(
          discount: '0%',
          remainingCoupons: 0,
          referralCode: '',
          restaurantName: '',
          isActive: false,
          endDate: DateTimeExtensions.today.add(const Duration(days: 30)),
        );

  String get discount => couponData.discount;
  String get remainingCoupons => '${couponData.remainingCoupons} قسيمة متبقية';
  String get status => couponData.status;
  String get referralCode => couponData.referralCode;
  String get restaurantName => couponData.restaurantName;
  bool get isActive => couponData.isActive;

  // TODO: Implement backend integration
  Future<void> fetchCouponData() async {
    // TODO: Call Firestore/API to get coupon data
    // Example:
    // final doc = await FirebaseFirestore.instance
    //     .collection('partners')
    //     .doc('partnerId')
    //     .get();
    // _couponData.addAll(doc.data() ?? {});
    // notifyListeners();
  }

  void setCurrentIndex(int index) {
    if (index >= 0 && index < _coupons.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  Future<void> updateCouponStatus(bool isActive) async {
    // TODO: Update status in backend
    if (_coupons.isNotEmpty && _currentIndex < _coupons.length) {
      _coupons[_currentIndex] = _coupons[_currentIndex].copyWith(
        isActive: isActive,
      );
      notifyListeners();
    }
  }

  void updateCurrentCoupon({
    String? discount,
    int? remainingCoupons,
    bool? isActive,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    if (_coupons.isNotEmpty && _currentIndex < _coupons.length) {
      _coupons[_currentIndex] = _coupons[_currentIndex].copyWith(
        discount: discount,
        remainingCoupons: remainingCoupons,
        isActive: isActive,
        startDate: startDate,
        endDate: endDate,
      );
      notifyListeners();
    }
  }

  List<CouponData> get coupons => List.unmodifiable(_coupons);

  Future<void> addCoupons(List<CouponData> coupons) async {
    // TODO: Submit coupons to Firestore/API
    // Example Firestore call:
    // final batch = FirebaseFirestore.instance.batch();
    // for (final coupon in coupons) {
    //   final docRef = FirebaseFirestore.instance.collection('coupons').doc();
    //   batch.set(docRef, {
    //     ...coupon,
    //     'partnerId': 'current_partner_id',
    //     'createdAt': FieldValue.serverTimestamp(),
    //     'isActive': true,
    //   });
    // }
    // await batch.commit();

    print('Adding coupons to backend: $coupons');

    // Add coupons to array
    _coupons.addAll(coupons);
    notifyListeners();
  }
}
