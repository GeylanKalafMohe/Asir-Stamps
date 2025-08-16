import 'package:flutter/material.dart';

import '../../models/user_info.dart';
import '../../screens/trip_planner/trip_planner_screen.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_images.dart';
import '../../widgets/form_screen_layout.dart';
import '../login_screen.dart';
import '../trip_info/trip_info_screen.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/form_title.dart';
import 'widgets/labeled_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  late final DateTime _birthDate;
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String _selectedCountryCode = '+966';
  String _selectedNationality = 'سعودي';
  String _selectedGender = 'ذكر';

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2002, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      _birthDate = date;
      _birthDateController.text =
          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Save user info to global variable
      userInfo = UserInfo(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        birthDate: _birthDate,
        phone: _phoneController.text,
        countryCode: _selectedCountryCode,
        nationality: _selectedNationality,
        gender: _selectedGender,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TripInfoScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      logo: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(AppIcons.hackathonLogo2, width: 200, color: Colors.white),
          const SizedBox(height: 40),
        ],
      ),
      buttonText: 'تسجيل',
      onButtonPressed: _register,
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            FormTitle(
              title: 'تسجيل جديد',
              subtitle: 'هل تملك حسابا بالفعل؟',
              onSubtitleActionText: 'سجل الدخول',
              onSubtitleAction: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              titleGradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF20233F),
                  Color(0xFF506698),
                  Color(0xFF5C5C5C),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // First and Last Name
            Row(
              children: [
                Expanded(
                  child: LabeledTextField(
                    controller: _firstNameController,
                    label: 'الاسم الأول',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم الأول';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LabeledTextField(
                    controller: _lastNameController,
                    label: 'الاسم الأخير',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم الأخير';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Email
            LabeledTextField(
              controller: _emailController,
              label: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال البريد الإلكتروني';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'الرجاء إدخال بريد إلكتروني صحيح';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Birth Date
            LabeledTextField(
              controller: _birthDateController,
              label: 'تاريخ الميلاد',
              readOnly: true,
              onTap: _selectDate,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء اختيار تاريخ الميلاد';
                }
                return null;
              },
              suffixIcon: const Icon(
                Icons.calendar_today,
                color: Colors.grey,
                size: 16,
              ),
            ),
            const SizedBox(height: 16),
            // Phone Number
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LabeledTextField(
                    controller: _phoneController,
                    label: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم الهاتف';
                      }
                      return null;
                    },
                    suffixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      child: Text(
                        '($_selectedCountryCode)',
                        style: AppFonts.bodyMedium.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 80,
                  child: CustomDropdown<String>(
                    label: 'الدولة',
                    value: AppConstants.countryCodes.keys.firstWhere(
                      (key) =>
                          AppConstants.countryCodes[key] ==
                          _selectedCountryCode,
                    ),
                    hintText: 'الدولة',
                    selectText: null,
                    items: AppConstants.countryCodes.keys.map((flag) {
                      return DropdownMenuItem(
                        value: flag,
                        child: Text(flag, style: const TextStyle(fontSize: 20)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountryCode =
                            AppConstants.countryCodes[value]!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Nationality and Gender
            Row(
              children: [
                Expanded(
                  child: CustomDropdown<String>(
                    label: 'الجنسية',
                    value: _selectedNationality,
                    hintText: 'الجنسية',
                    prefixIcon: Text(
                      AppConstants.nationalityFlags[_selectedNationality] ??
                          '🇸🇦',
                      style: const TextStyle(fontSize: 16),
                    ),
                    items: AppConstants.nationalityFlags.keys.map((
                      nationality,
                    ) {
                      return DropdownMenuItem(
                        value: nationality,
                        child: Text(nationality),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedNationality = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomDropdown<String>(
                    label: 'الجنس',
                    value: _selectedGender,
                    hintText: 'الجنس',
                    items: const [
                      DropdownMenuItem(value: 'ذكر', child: Text('ذكر')),
                      DropdownMenuItem(value: 'أنثى', child: Text('أنثى')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Password
            LabeledTextField(
              controller: _passwordController,
              label: 'كلمة المرور',
              obscureText: _obscurePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال كلمة المرور';
                }
                if (value.length < 6) {
                  return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                }
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
