import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_images.dart';
import '../../widgets/form_screen_layout.dart';
import '../login_screen.dart';
import '../sign_up/widgets/custom_dropdown.dart';
import '../sign_up/widgets/form_title.dart';
import '../sign_up/widgets/labeled_text_field.dart';

class PartnerRegistrationScreen extends StatefulWidget {
  const PartnerRegistrationScreen({super.key});

  @override
  State<PartnerRegistrationScreen> createState() =>
      _PartnerRegistrationScreenState();
}

class _PartnerRegistrationScreenState extends State<PartnerRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final _businessNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  // Form data
  String? _businessType;
  String _selectedCountryCode = '+966';
  bool _acceptTerms = false;

  // Business types options
  final List<String> _businessTypes = [
    "مطعم تراثي",
    "كوفي شوب",
    "متجر هدايا",
    "فندق",
    "منتجع",
    "مركز ثقافي",
    "متحف",
    "مركز مغامرات",
    "أخرى",
  ];

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى الموافقة على الشروط والأحكام')),
        );
        return;
      }
      await _saveForm();
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  // Save form data - ready for backend integration
  Future<void> _saveForm() async {
    final formData = {
      "businessName": _businessNameController.text,
      "businessType": _businessType,
      "responsiblePersonFirstName": _firstNameController.text,
      "responsiblePersonLastName": _lastNameController.text,
      "phone": "$_selectedCountryCode${_phoneController.text}",
      "email": _emailController.text,
      "acceptedTerms": _acceptTerms,
      "submittedAt": DateTime.now().toIso8601String(),
    };

    print('Partner Registration Data: $formData');

    // TODO: Send to Firestore
    // await FirebaseFirestore.instance.collection('partner_registrations').add(formData);

    // TODO: Send to REST API
    // final response = await http.post(
    //   Uri.parse('https://api.example.com/partner-registration'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(formData),
    // );

    // TODO: Add state management (Provider/Riverpod)
    // context.read<PartnerProvider>().submitRegistration(formData);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'شكراً لتسجيل اهتمامك! سيتواصل معك أعضاء فريقنا في غضون 48 ساعة',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: FormScreenLayout(
        showBackButton: false,
        logo: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AppIcons.hackathonLogo2,
              width: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 40),
          ],
        ),
        buttonText: 'تسجيل اهتمام شريك',
        onButtonPressed: _submitForm,
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              FormTitle(
                title: 'تسجيل شريك جديد',
                subtitle: 'هل أنت شريك بالفعل؟',
                onSubtitleActionText: 'سجل الدخول',
                onSubtitleAction: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                titleGradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFF383C),
                    Color(0xFF506698),
                    Color(0xFF131413),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Business Name
              LabeledTextField(
                controller: _businessNameController,
                label: 'اسم المنشأة التجاري',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال اسم المنشأة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Business Type
              CustomDropdown<String>(
                label: 'نوع النشاط التجاري',
                value: _businessType,
                hintText: '',
                validator: (value) {
                  if (value == null) {
                    return 'الرجاء اختيار نوع النشاط التجاري';
                  }
                  return null;
                },
                items: _businessTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) => setState(() => _businessType = value),
              ),
              const SizedBox(height: 16),

              // Responsible Person Name
              Row(
                children: [
                  Expanded(
                    child: LabeledTextField(
                      controller: _firstNameController,
                      label: 'الاسم الأول للمسؤول',
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
                      label: 'الاسم الأخير للمسؤول',
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
                          child: Text(
                            flag,
                            style: const TextStyle(fontSize: 20),
                          ),
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

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) =>
                        setState(() => _acceptTerms = value ?? false),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _acceptTerms = !_acceptTerms),
                      child: RichText(
                        text: TextSpan(
                          text: 'بموافقتك على ',
                          style: AppFonts.bodySmall.copyWith(
                            color: Colors.black,
                            fontWeight: AppFonts.medium,
                          ),
                          children: [
                            TextSpan(
                              text: 'الشروط والأحكام',
                              style: AppFonts.bodySmall.copyWith(
                                color: const Color(0xFF0C559E),
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xFF0C559E),
                                decorationThickness: 0.5,
                                height: 1.5,
                                fontWeight: AppFonts.medium,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' سيتواصل معك أعضاء فريقنا في غضون 48 ساعة.',
                              style: AppFonts.bodySmall.copyWith(
                                color: Colors.black,
                                fontWeight: AppFonts.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
