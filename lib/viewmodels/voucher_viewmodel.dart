import 'package:flutter/foundation.dart';

import '../models/voucher_record.dart';

class VoucherViewModel extends ChangeNotifier {
  final List<VoucherRecord> _voucherRecords = [
    VoucherRecord(
      profileImage: 'assets/partners/p1.png',
      id: 'CP-SA-00001',
      discountPercentage: 15.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    VoucherRecord(
      profileImage: 'assets/partners/p2.png',
      id: 'CP-SA-00002',
      discountPercentage: 20.0,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    VoucherRecord(
      profileImage: 'assets/partners/p3.png',
      id: 'CP-SA-00003',
      discountPercentage: 10.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  List<VoucherRecord> get voucherRecords => List.unmodifiable(_voucherRecords);

  void addVoucherRecord({
    required String profileImage,
    required String id,
    required double discountPercentage,
  }) {
    final record = VoucherRecord(
      profileImage: profileImage,
      id: id,
      discountPercentage: discountPercentage,
      date: DateTime.now(),
    );

    _voucherRecords.add(record);
    notifyListeners();
  }

  void removeVoucherRecord(int index) {
    if (index >= 0 && index < _voucherRecords.length) {
      _voucherRecords.removeAt(index);
      notifyListeners();
    }
  }

  int get totalRecords => _voucherRecords.length;
}
