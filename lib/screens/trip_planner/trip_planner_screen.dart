import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

import '../../models/category_item.dart';
import '../../models/popular_place.dart';
import '../../models/user_info.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'widgets/categories_section.dart';
import 'widgets/plan_trip_section.dart';
import 'widgets/popular_places_section.dart';

final userInfo = UserInfo(
  name: 'بكر شاهر',
  location: 'عسير، أبها',
  profileImage: AppImages.dummyProfile,
);

final popularPlaces = [
  PopularPlace(
    id: 'place6',
    image: AppImages.place6,
    title: 'متحف الراقدي',
    subtitle: 'متحف تراثي وثقافي',
    location: 'عسير، أبها',
    description:
        'يقع متحف الراقدي في مدينة أبها بالقرب من جبل ذره ،يتألف المتحف من تسعة أقسام مختلفة قسم النحاسيات قسم الملابس والفضيات التراثية النسائية قسم المطبخ القديم والحرف اليدوية وأدوات الزراعة قسم المجلس العسيري القديم قسم الجلسة التهامية قسم القرية العسيرية وفن العمارة بالحجر قسم أعمال صاحب المتحف قسم الجلسة الساحلية قسم بيع القطع والمنتجات التراثية والشعبية ،هذا التنظيم يسهم في توفير تجربة شاملة وممتعة للزوار.',
    workingHours: '9:00 صباحا - 9:00 مساء',
    requiredStamps: 10,
    collectedStamps: 8,
    similarPlaces: ['place5'],
    googleMapsLink: 'https://maps.app.goo.gl/UgRh29ULt5REGJBb7',
    entryFee: '20 ريال',
    stampType: 'gold',
    coordinates: LatLng(18.204592, 42.505179),
  ),
  PopularPlace(
    id: 'place1',
    image: AppImages.place1,
    title: 'قرية المسقي',
    subtitle: 'قرية تراثية نادرة',
    location: 'عسير، أبها',
    description:
        'تقع قرية المسقي جنوب مدينة أبها على بعد حوالي 33 كيلومترًا، وهي واقعة بالقرب من الطريق الرابط بين تمنية وأبها، تُعتبر بلدة المسقي من أقدم القرى في جنوب المملكة العربية السعودية، وتتميز بمعالمها التاريخية البارزة، حيث يبرز "الجامع الكبير" وسط القرية على ربوة مرتفعة، وتصل مساحته إلى حوالي 409.25 متر مربع،تم تصميم القرية على مر العصور بطريقة هندسية تميزها، حيث تتخللها طرق وممرات داخلية تربط جميع بيوت القرية بسلاسة واتساق ،تضم القرية برجين مربعي الشكل، وكل برج يتكون من أربعة طوابق ،تضم القرية داخل أسوارها 6 آبار، وتحيط بها جبال مختلفة الارتفاع مثل جبال "جربان" و"جريبة" غربًا وجبل "لذن" شرقًا ،وتمر بمحاذاة القرية عدة أودية من بينها وادي "عتود" وهناك أودية فرعية شرق القرية وغربها.',
    workingHours: '24 ساعة',
    requiredStamps: 15,
    collectedStamps: 3,
    similarPlaces: ['place3'],
    googleMapsLink: 'https://maps.app.goo.gl/46u87AHGgvfHWkfPA',
    entryFee: 'مجانا',
    stampType: 'silver',
    coordinates: LatLng(18.041998, 42.746208),
  ),
  PopularPlace(
    id: 'place2',
    image: AppImages.place2,
    title: 'قلعة شمسان',
    subtitle: 'قلعة تاريخية أثرية',
    location: 'عسير، أبها',
    description:
        'قلعة شمسان تقع شمال شرقي مدينة أبها، وتُعتبر وجهة تاريخية بارزة على قمة جبل شمسان ، حيث يبلغ طول القلعة حوالي 90 مترًا وعرضها 50 مترًا، تتألف القلعة من ثلاثة أبراج دفاعية في زوايا مختلفة، وتتميز تصميمها بالاستخدام المتقن للأدوات الحجرية بأحجام وأشكال متنوعة ،بنيت القلعة بتصميمها الحالي قبل أكثر من 100 عام، وتعتبر مثالًا بارزًا للأسلوب والفنون المعمارية التقليدية.',
    workingHours: '24 ساعة',
    requiredStamps: 15,
    collectedStamps: 5,
    similarPlaces: ['place4'],
    googleMapsLink: 'https://maps.app.goo.gl/DEw3RV2xiJP68hL6A',
    entryFee: 'مجانا',
    stampType: 'gold',
    coordinates: LatLng(18.225439, 42.503641),
  ),
  PopularPlace(
    id: 'place3',
    image: AppImages.place3,
    title: 'قرية العكاس',
    subtitle: 'قرية تراثية تاريخية',
    location: 'عسير، أبها',
    description:
        'تقع قرية العكاس التراثية قرية تراثية تاريخية، بمدينة أبها بمنطقة عسير، تقع في شمال غرب أبها على مسافة 10 كم، في السودة. وتبعد عن مطار أبها الدولي حوالي 31كم، وهي تعتبر واحدة من أهم القرى التراثية. حيث القلاع الحربية وأكثر من خمسين منزلًا وموقعًا تراثيًا، والمتميزة بتوزيعها، بدءًا من جامعها الكبير وصولًا إلى ساحاتها العامة التي كانت تضم المناسبات الاجتماعية، ويعود عمرها إلى أكثر من 300 عام.',
    workingHours: '24 ساعة',
    requiredStamps: 12,
    collectedStamps: 1,
    similarPlaces: ['place1'],
    googleMapsLink: 'https://maps.app.goo.gl/gBqgB4WYy9Ekv7PFA',
    entryFee: 'مجانا',
    stampType: 'bronze',
    coordinates: LatLng(18.267185, 42.445461),
  ),

  PopularPlace(
    id: 'place5',
    image: AppImages.place5,
    title: 'متحف الأجيال التراثي',
    subtitle: 'متحف تراثي وثقافي',
    location: 'عسير، قرية العين آل يعلا',
    description:
        'يقع متحف الأجيال التراثي شمال مدينة أبها في قرية العين آل يعلا بني مالك عسير، حيث يبعد عن أبها مسافة تقدر بـ 12 كيلومتر ويتكون من مبنى مستقل يبلغ مساحته 48 متر مربع يضم المتحف مجموعة متنوعة من المعروضات التراثية والتاريخية، بما في ذلك المخطوطات القديمة والوثائق والعملات والحلي والفضيات، بالإضافة إلى الأسلحة وأدوات الحرب، والهواتف القديمة، والملابس التراثية، وأدوات الزراعة والمطبخ، والمكاييل والموازين والنحاسيات والمصنوعات الجلدية المختلفة',
    workingHours: '9:00 صباحا - 9:00 مساء',
    requiredStamps: 8,
    collectedStamps: 0,
    similarPlaces: ['place6'],
    googleMapsLink: 'https://maps.app.goo.gl/41V7uwYWAKAQTT6F9',
    entryFee: '20 ريال',
    stampType: 'silver',
    coordinates: LatLng(18.314292, 42.540113),
  ),
  PopularPlace(
    id: 'place4',
    image: AppImages.place4,
    title: 'قرية طبب - قصور أبو نقطة',
    subtitle: 'مجموعة حصون وقصور تاريخية',
    location: 'عسير، طبب',
    description:
        'قصور أبو نقطة المتحمي، هي مجموعة حصون وقصور تاريخية تقع في بلدة طبب التابعة لمنطقة عسير جنوب غربي المملكة العربية السعودية حيث تتكون حصون وقصور أبو نقطة المتحمي من ستة مواقع متجاورة ومتفاوتة في الأحجام والارتفاع، تقع على مساحة نحو 4000م2، وتضم عددًا من المدافن متنوعة الحجم والعمق، يتراوح عمقها بين مترين وثلاثة أمتار، وعرضها ما بين 6 و15م، كانت تستخدم لدفن المحاصيل الزراعية للمحافظة عليها وتخزينها لسنين طويلة، للاستفادة منها في سنوات الجدب والحروب وتوقف الزراعة. ولأهمية الموقع، استُخدمت هذه المدافن لإخفاء الذخائر أثناء المواجهات والحروب.',
    workingHours: 'يوميا | 8:00 صباحا - 6:00 مساء',
    requiredStamps: 10,
    collectedStamps: 8,
    similarPlaces: ['place2'],
    googleMapsLink: 'https://maps.app.goo.gl/9mMUcs63iiuqoijq7',
    stampType: 'bronze',
    coordinates: LatLng(18.367025, 42.370181),
  ),
  PopularPlace(
    id: 'place7',
    image: AppImages.place1, // Using existing image
    title: 'متحف دحدوح',
    subtitle: 'متحف تراثي وثقافي',
    location: 'عسير، أبها',
    description:
        'متحف دحدوح هو أحد المتاحف التراثية المميزة في منطقة عسير، يضم مجموعة نادرة من القطع الأثرية والتراثية التي تحكي تاريخ المنطقة وثقافتها العريقة.',
    workingHours: '9:00 صباحا - 6:00 مساء',
    requiredStamps: 8,
    collectedStamps: 2,
    similarPlaces: ['place6', 'place5'],
    googleMapsLink: 'https://maps.app.goo.gl/PD2QMrTpNCGd3kGA6',
    entryFee: '15 ريال',
    stampType: 'gold',
    coordinates: LatLng(18.936223, 42.174679),
  ),
  PopularPlace(
    id: 'place9',
    image: AppImages.place2, // Using existing image
    title: 'منتزه جبل خلقة',
    subtitle: 'منتزه طبيعي جبلي',
    location: 'عسير، جبل خلقة',
    description:
        'منتزه جبل خلقة يقع في منطقة عسير ويتميز بإطلالاته الخلابة والطبيعة الجبلية الساحرة، وهو وجهة مثالية لمحبي الطبيعة والمناظر الطبيعية.',
    workingHours: '6:00 صباحا - 10:00 مساء',
    requiredStamps: 6,
    collectedStamps: 1,
    similarPlaces: ['place2'],
    googleMapsLink: 'https://maps.app.goo.gl/RwzL983q3TT4TFh2A',
    entryFee: 'مجانا',
    stampType: 'bronze',
    coordinates: LatLng(18.763949, 42.242384),
  ),
  PopularPlace(
    id: 'place10',
    image: AppImages.place4, // Using existing image
    title: 'قصر العسابله',
    subtitle: 'قصر تاريخي أثري',
    location: 'عسير، العسابله',
    description:
        'قصر العسابله هو أحد القصور التاريخية المهمة في منطقة عسير، يتميز بعمارته التراثية الفريدة ويعكس تاريخ المنطقة وثقافتها العريقة.',
    workingHours: '8:00 صباحا - 5:00 مساء',
    requiredStamps: 10,
    collectedStamps: 6,
    similarPlaces: ['place4', 'place2'],
    googleMapsLink: 'https://maps.app.goo.gl/uKv9oCZ6BGjripp58',
    entryFee: '10 ريال',
    stampType: 'gold',
    coordinates: LatLng(19.120426, 42.130907),
  ),
];

class TripPlannerScreen extends StatelessWidget {
  const TripPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryItem(icon: AppIcons.whistle, title: 'مزارات سياحية'),
      CategoryItem(icon: AppIcons.mountain, title: 'أماكن جبلية'),
      CategoryItem(icon: AppIcons.desk, title: 'معالم أثرية'),
      CategoryItem(icon: AppIcons.building, title: 'القرى التراثية'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80 + MediaQuery.paddingOf(context).top),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            decoration: const BoxDecoration(
              color: AppColors.navbarBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(userInfo.profileImage),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'أهلا بك، ${userInfo.name}',
                            style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white70,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                userInfo.location,
                                style: AppFonts.bodySmall.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث عن وجهتك القادمة',
                    hintStyle: AppFonts.bodySmall.copyWith(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CategoriesSection(categories: categories),
            const SizedBox(height: 16),
            PopularPlacesSection(places: popularPlaces.take(6).toList()),
            const SizedBox(height: 32),
            const PlanTripSection(),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
