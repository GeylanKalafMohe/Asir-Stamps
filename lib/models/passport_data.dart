class PassportData {
  final String referenceNumber;
  final String userName;
  final String location;
  final String profileImage;
  final int currentLevel;
  final int stampsToNextLevel;
  final int goldStamps;
  final int silverStamps;
  final int bronzeStamps;

  PassportData({
    required this.referenceNumber,
    required this.userName,
    required this.location,
    required this.profileImage,
    required this.currentLevel,
    required this.stampsToNextLevel,
    required this.goldStamps,
    required this.silverStamps,
    required this.bronzeStamps,
  });
}