import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/trip_info.dart';
import '../../utils/app_images.dart';
import '../../viewmodels/ai_trip_planner_viewmodel.dart';
import '../../widgets/form_screen_layout.dart';
import '../main_tab_screen.dart';
import '../sign_up/widgets/custom_dropdown.dart';
import '../sign_up/widgets/form_title.dart';
import '../trip_planner/trip_planner_screen.dart';
import 'widgets/multi_select_field.dart';

class TripInfoScreen extends StatefulWidget {
  const TripInfoScreen({super.key});

  @override
  State<TripInfoScreen> createState() => _TripInfoScreenState();
}

class _TripInfoScreenState extends State<TripInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form data
  String? _purpose;
  String? _duration;
  String? _accommodationType;
  String? _accommodationPlace;
  List<String> _preferences = [];
  List<String> _plannedAttractions = [];
  String? _transport;
  String? _visitRepeat;
  String? _budget;
  List<String> _heardAbout = [];

  // Sample data lists
  final List<String> _purposes = [
    "ترفيه",
    "عمل",
    "زيارة عائلية",
    "مغامرة",
    "استرخاء",
  ];
  final List<String> _durations = [
    "1 يوم",
    "2 أيام",
    "3 أيام",
    "7 أيام",
    "أكثر من أسبوع",
  ];
  final List<String> _accommodationTypes = [
    "فندق",
    "شقة مفروشة",
    "منتجع",
    "بيت ضيافة",
  ];
  final List<String> _accommodationPlaces = [
    "أحد رفيدة",
    "أبها",
    "النماص",
    "رجال ألمع",
  ];
  final List<String> _preferencesOptions = [
    "مغامرات",
    "ثقافة وتراث",
    "مطاعم",
    "هدوء",
    "مشاهدة طبيعة",
  ];

  final List<String> _transports = [
    "سيارات الأجرة",
    "تأجير سيارات",
    "الحافلات",
    "المشي",
  ];
  final List<String> _visitFrequency = ["زائر أول", "زائر متكرر"];
  final List<String> _budgetOptions = [
    "أقل من 3,500 ريال",
    "3,500 - 7,000 ريال",
    "7,000 - 10,000 ريال",
    "10,000 - 12,000 ريال",
    "أكثر من 12,000 ريال",
  ];
  final List<String> _heardAboutOptions = [
    "وسائل التواصل",
    "صديق أو عائلة",
    "بحث على الإنترنت",
    "إعلان",
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _saveForm();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainTabScreen()),
      );
    }
  }

  // Save form data - ready for backend integration
  void _saveForm() {
    final tripInfo = TripInfo(
      purpose: _purpose,
      duration: _duration,
      accommodationType: _accommodationType,
      accommodationPlace: _accommodationPlace,
      preferences: _preferences,
      plannedAttractions: _plannedAttractions,
      transport: _transport!,
      visitRepeat: _visitRepeat!,
      budget: _budget!,
      heardAbout: _heardAbout,
      submittedAt: DateTime.now(),
    );

    print('Trip Info: ${tripInfo.toMap()}');

    // Save to AiTripPlannerViewModel
    final aiViewModel = Provider.of<AiTripPlannerViewModel>(
      context,
      listen: false,
    );
    aiViewModel.saveTripInfo(tripInfo);

    // TODO: Send to Firestore
    // FirebaseFirestore.instance.collection('trip_info').add(formData);

    // TODO: Send to REST API
    // final response = await http.post(
    //   Uri.parse('https://api.example.com/trip-info'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(formData),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: FormScreenLayout(
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        logo: Column(
          children: [
            Transform.translate(
              offset: Offset(-20, 20), // move -20px right, 20px down
              child: Image.asset(
                AppImages.bookletLogoCut,
                width: double.infinity,
                // color: Colors.white,
              ),
            ),
            // const SizedBox(height: 40),
          ],
        ),
        buttonText: 'إكمال معلومات الرحلة',
        onButtonPressed: _submitForm,
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              FormTitle(
                title: 'معلومات الرحلة',
                subtitle: 'خلينا نعرف عنك',
                onSubtitleActionText: 'أكثر!',
                titleGradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF3F2021),
                    Color(0xFF985050),
                    Color(0xFF20233F),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Purpose and Duration
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'الغرض من الزيارة',
                      value: _purpose,
                      hintText: '',
                      items: _purposes.map((purpose) {
                        return DropdownMenuItem(
                          value: purpose,
                          child: Text(purpose),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _purpose = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار الغرض من الزيارة';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'مدة الإقامة المخططة',
                      value: _duration,
                      hintText: '',
                      items: _durations.map((duration) {
                        return DropdownMenuItem(
                          value: duration,
                          child: Text(duration),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _duration = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار مدة الإقامة';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Accommodation Type and Place
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'نوع السكن',
                      value: _accommodationType,
                      hintText: '',
                      items: _accommodationTypes.map((type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _accommodationType = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار نوع السكن';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'مكان الإقامة',
                      value: _accommodationPlace,
                      hintText: '',
                      items: _accommodationPlaces.map((place) {
                        return DropdownMenuItem(
                          value: place,
                          child: Text(place),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _accommodationPlace = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار مكان الإقامة';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Preferences (Multi-select)
              MultiSelectField(
                label: 'التفضيلات والاهتمامات',
                options: _preferencesOptions,
                selectedValues: _preferences,
                onChanged: (values) => setState(() => _preferences = values),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'الرجاء اختيار تفضيل واحد على الأقل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Planned Attractions (Multi-select)
              MultiSelectField(
                label: 'المعالم التي تخطط لزيارتها',
                options: popularPlaces.map((place) => place.title).toList(),
                selectedValues: _plannedAttractions,
                onChanged: (values) =>
                    setState(() => _plannedAttractions = values),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'الرجاء اختيار معلم واحد على الأقل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Transport and Visit Frequency
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'وسيلة النقل المفضلة',
                      value: _transport,
                      hintText: '',
                      items: _transports.map((transport) {
                        return DropdownMenuItem(
                          value: transport,
                          child: Text(transport),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _transport = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار وسيلة النقل';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDropdown<String>(
                      label: 'تكرار زيارة المنطقة',
                      value: _visitRepeat,
                      hintText: '',
                      items: _visitFrequency.map((frequency) {
                        return DropdownMenuItem(
                          value: frequency,
                          child: Text(frequency),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _visitRepeat = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار تكرار الزيارة';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Budget
              CustomDropdown<String>(
                label: 'الميزانية المتوقعة',
                value: _budget,
                hintText: '',
                items: _budgetOptions.map((budget) {
                  return DropdownMenuItem(value: budget, child: Text(budget));
                }).toList(),
                onChanged: (value) => setState(() => _budget = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء اختيار الميزانية';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // How heard about app
              MultiSelectField(
                label: 'كيف سمعت عن التطبيق؟',
                options: _heardAboutOptions,
                selectedValues: _heardAbout,
                onChanged: (values) => setState(() => _heardAbout = values),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'الرجاء اختيار طريقة واحدة على الأقل';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
