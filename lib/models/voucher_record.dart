class VoucherRecord {
  final String profileImage;
  final String id;
  final double discountPercentage;
  final DateTime date;

  VoucherRecord({
    required this.profileImage,
    required this.id,
    required this.discountPercentage,
    required this.date,
  });
}
