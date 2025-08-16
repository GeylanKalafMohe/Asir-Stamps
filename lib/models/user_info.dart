import 'package:asir_stamps_app/utils/app_images.dart';

class UserInfo {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final String phone;
  final String countryCode;
  final String nationality;
  final String gender;
  final String profileImage;

  UserInfo({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.phone,
    required this.countryCode,
    required this.nationality,
    required this.gender,
    this.profileImage = AppImages.dummyProfile,
  });

  String get fullName => '$firstName $lastName';
  String get location => 'عسير، أبها';
  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
