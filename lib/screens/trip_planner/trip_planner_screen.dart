import 'package:asir_stamps_app/screens/discover_aseer/widgets/discover_top_bar.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/tracks_section.dart';
import 'package:asir_stamps_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

import '../../models/category_item.dart';
import '../../models/popular_place.dart';
import '../../models/user_info.dart';
import '../../utils/app_fonts.dart';
import 'widgets/categories_section.dart';
import 'widgets/plan_trip_section.dart';
import 'widgets/popular_places_section.dart';

UserInfo userInfo = UserInfo(
  firstName: 'بكر',
  lastName: 'شاهر',
  email: 'bakr.shaher@example.com',
  birthDate: DateTime(1995, 1, 1),
  phone: '501234567',
  countryCode: '+966',
  nationality: 'سوري',
  gender: 'ذكر',
  profileImage: AppImages.dummyProfile,
);

final eventPlaces = [
  PopularPlace(
    id: 'event1',
    image: AppImages.event1,
    title: 'مهرجان وصل',
    subtitle: 'جزيرة ساحرة تشتهر بجمالها وهدوئها ونقاء مياهها',
    location: 'عسير، أبها',
    description: """
مهرجان وصل للمأكولات العسيرية يقدم تجارب غنية ومتنوعة بمشاركة نخبة من أشهر الطهاة من المنطقة الجنوبية. يشمل المهرجان تقديم 15 طبقًا يوميًا من الأكلات الشعبية الأصيلة، إلى جانب عروض فلكلورية مميزة، وتجارب ثقافية مثل نقش الحناء، صناعة الطوق الوردي، وبازار لبيع المنتجات الحرفية الجنوبية. كما يضم ممرًا مخصصًا للمزارعين لعرض وبيع منتجاتهم المحلية الطازجة.

لماذا تزور مهرجان المأكولات العسيرية؟

1. تجربة أصيلة من قلب الجنوب
على مدار 30 يومًا، استمتع بنكهات عسير الغنية، وعيش تفاصيل المطبخ الجنوبي الأصيل في أجواء تراثية وعائلية وسط طبيعة عسير الخلابة.

2. تذوّق، تفاعل، وشارك
من المأكولات التقليدية إلى ورش الطهي التفاعلية، انغمس في تجارب متنوعة مثل:

خبز التنور

طريقة عمل العريكة والعصيدة

التعرف على أسرار الطهي من طهاة محليين وعالميين

3. رحلة من المزرعة إلى المائدة
اكتشف ممر المزارعين المليء بالفواكه الموسمية المحلية، وجرّب أنشطة الريف من حلب الأبقار إلى طحن الحبوب وصناعة الخبز.

موعد الفعالية: 5 أغسطس 2025 – 5 سبتمبر 2025
""",
    workingHours: 'يوميًا 4:00 مساء إلى 12:00 صباحا',
    requiredStamps: 10,
    collectedStamps: 8,
    similarPlaces: [],
    googleMapsLink:
        'https://www.google.com/maps/search/?api=1&query=18.2135278,42.4952222',
    entryFee: '25 ريال',
    stampType: 'silver',
    coordinates: LatLng(18.2135278, 42.4952222),
  ),
  PopularPlace(
    id: 'event2',
    image: AppImages.event2,
    title: 'واحة عسيب',
    subtitle:
        'تجربة عائلية متكاملة تجمع بين الهدوء الترفيه وعروض الخيل في أجواء صيفية معتدلة تناسب كل الأعمار.',
    location: 'عسير، أبها',
    description:
        'تجربة عائلية متكاملة تجمع بين الهدوء الترفيه وعروض الخيل في أجواء صيفية معتدلة تناسب كل الأعمار. موعد الفعالية: 12 يونيو 2025 – 23 أغسطس 2025',
    workingHours: 'يوميًا 12:00 صباحا إلى 12:00 صباحا',
    requiredStamps: 10,
    collectedStamps: 8,
    similarPlaces: [],
    googleMapsLink:
        'https://www.google.com/maps/search/?api=1&query=18.236698,42.679719',
    entryFee: '50 ريال',
    stampType: 'silver',
    coordinates: LatLng(18.236698, 42.679719),
  ),
];

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
    image: AppImages.place7,
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
    image: AppImages.place9,
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
    image: AppImages.place10,
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
  PopularPlace(
    id: 'place12',
    image: AppImages.place12,
    title: 'منتزه دلغان',
    subtitle: 'منتزه عائلي طبيعي',
    location: 'عسير، دلغان',
    description:
        'منتزه دلغان ليس مجرد مساحة خضراء، بل هو وجهة نابضة بالحياة في قلب مرتفعات عسير ذات الأجواء المعتدلة. تحيط به التلال والأشجار المحلية، ويجمع بين هدوء الطبيعة وروح المغامرة الخفيفة. تجول في الممرات المظللة المزينة بالأزهار الموسمية، أو استرخِ في مناطق الجلوس العائلية حيث يجتمع الزوّار تحت ظلال الأشجار العالية لقضاء أوقات هادئة. وتُطل النقاط المرتفعة في المنتزه على مناظر بانورامية تخطف الأنفاس لوُديان عسير مناسبة للتأمل أو لاحتساء القهوة وسط السكون.',
    workingHours: '24 ساعة',
    requiredStamps: 8,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/9ysyfCpBT9rteVB59',
    entryFee: 'مجانا',
    stampType: 'bronze',
    coordinates: LatLng(18.102047, 42.705239),
    categories: ['عائلات'],
  ),
  PopularPlace(
    id: 'place13',
    image: AppImages.place13,
    title: 'قرية زبنة',
    subtitle: 'قرية تراثية ومسار تسلق',
    location: 'عسير، زبنة',
    description:
        'هي قرية يتلاقى عبق الماضي مع هدوء الطبيعة. تدعوك هذه الوجهة الفريدة لاستكشاف البيوت القديمة المرممة والمسجد التراثي، حيث يعكس كل بناء حكاية تاريخية عريقة للمنطقة. أثناء تجوالك في القرية، ستشعر بسحر العمارة التقليدية ودفء المجتمع الذي حافظ على إرثه الثقافي عبر القرون. توفر البيئة الهادئة ملاذاً مثالياً لعشاق التراث والطبيعة على حد سواء، مما يعطي نظرة فريدة على الجمال الخالد لمنطقة عسير.',
    workingHours: '24 ساعة',
    requiredStamps: 10,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/gTV6AAaNqz9tQWBL6',
    entryFee: 'مجانا',
    stampType: 'silver',
    coordinates: LatLng(18.338312, 42.340754),
    categories: ['تسلق', 'عائلات', 'تراث'],
  ),
  PopularPlace(
    id: 'place14',
    image: AppImages.place14,
    title: 'متحف القط',
    subtitle: 'متحف تراثي فريد',
    location: 'عسير، أبها',
    description:
        'متحف القط العسيري بالحياة. يخصص هذا المتحف الفريد لتراث وفن المرأة العسيرية، ويقدم تجربة غامرة تكشف عن أسلوبها المميز في تزيين المنازل والحياة اليومية. من لحظة دخولك، تستقبلك النباتات العطرية عند المدخل لتأخذك إلى عالم من الأنماط الهندسية والزخارف الزاهية. تزين الجدران خطوط القط الملونة التي تروي قصصاً عن التراث الثقافي والتعبير الفني، وهو ما اعترف به اليونسكو كتراث غير مادي. يمكن للزوار المشاركة في ورش تعليمية للتعرف على هذا الفن واقتناء منتجات مزينة بنقوش القط الفريدة. أثناء جولتك، ستتعرف على الرموز الجميلة في نقوش القط التي تعكس قيم وتقاليد المجتمع المحلي. شاهد المهارة الرائعة للنساء العسيريات في استخراج الألوان الطبيعية من البيئة المحيطة واستخدامها في تزيين المنازل.',
    workingHours: '11:00 صباحا - 8:00 مساء',
    requiredStamps: 8,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/pMjrHYuYiSvsDJWb6',
    entryFee: 'رسوم دخول',
    stampType: 'gold',
    coordinates: LatLng(18.190499, 42.542555),
    categories: ['تراث'],
  ),
  PopularPlace(
    id: 'place15',
    image: AppImages.place15,
    title: 'حديقة الاربوعة',
    subtitle: 'حديقة عائلية ومسار تسلق',
    location: 'عسير، تنومة',
    description:
        'يقع في الجهة الغربية لتنومة، ويطل على المنحدرات الغربية، ويشتهر برعي الأغنام وصناعة العسل حيث يمتاز بالزراعة ووفرة الغابات الكثيفة.',
    workingHours: '24 ساعة',
    requiredStamps: 6,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/sfFMEbBwKznjw5Uz9',
    entryFee: 'مجانا',
    stampType: 'bronze',
    coordinates: LatLng(18.9363358, 41.9957666),
    categories: ['تسلق', 'عائلات'],
  ),
  PopularPlace(
    id: 'place16',
    image: AppImages.place16,
    title: 'جبل السودة',
    subtitle: 'أعلى جبال المملكة',
    location: 'عسير، السودة',
    description:
        ': السودة هو أعلى جبال المملكة العربية السعودية ضمن سلسلة جبال عسير، حيث يبلغ ارتفاعه 3،133 مترًا. ويكسو الجبل أشجار العرعر الكثيفة مكونة غابات طبيعية. توجد به قرية سياحية تبعد عن مدينة أبها 20 كلم، وعلى ارتفاع 3015 متر عن سطح البحر. ولها تلفريك يصل إلى أعلى الجبل.',
    workingHours: '24 ساعة',
    requiredStamps: 15,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/yUXbBPh1HsBK7nP99',
    entryFee: 'مجانا',
    stampType: 'gold',
    coordinates: LatLng(18.9518912, 42.148014),
    categories: ['تسلق'],
  ),
  PopularPlace(
    id: 'place17',
    image: AppImages.place17,
    title: 'واجهة الشرف',
    subtitle: 'موقع تسلق صخري',
    location: 'عسير، الشرف',
    description:
        'موقع صخري يعد من اهم وجهات التسلق في المملكة وهو اول موقع تم تطويره من قبل الاتحاد السعودي للتسلق والتسلق.',
    workingHours: '24 ساعة',
    requiredStamps: 12,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/KsPDqEy4YYdCdX9v9',
    entryFee: 'مجانا',
    stampType: 'gold',
    coordinates: LatLng(18.225439, 42.503641),
    categories: ['تسلق'],
  ),
  PopularPlace(
    id: 'place18',
    image: AppImages.place18,
    title: 'واجهة الكتاب',
    subtitle: 'موقع تسلق متقدم',
    location: 'عسير، الكتاب',
    description:
        'تعد من اهم مواقع التسلق المتعددة في المملكة وتحتوي على مجموعة من أطول المسارات الوطنية وأكثرها تميز يتفرد الموقع بتضاريسه الصخرية وارتفاعاته مما يجعله وجهه رئيسية لعشاق التحدي والتسلق ',
    workingHours: '24 ساعة',
    requiredStamps: 15,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/Kp1CXeM3QY6tb1LU9',
    entryFee: 'مجانا',
    stampType: 'gold',
    coordinates: LatLng(18.9507778, 42.1489722),
    categories: ['تسلق'],
  ),
  // New places
  PopularPlace(
    id: 'place11',
    image: AppImages.place11,
    title: 'قرية الحوزة',
    subtitle: 'قرية تراثية فريدة',
    location: 'عسير، الحوزة',
    description:
        'قلاع وحصون فريدة من طراز هندسي أخّاذ و قصور شامخة تزهو بتشييد عمراني مترابط مُشيدة بخامات البيئة , أعدادها تفوق المائة بيت، وتتنوع ارتفاعاتها حيث يصل بعضها إلى ستة أدوار من الطين بشكل معماري جميل وتُسقف بأخشاب السدر والشوحط ثم تسقف بالطين بشكل متماسك يمنع تسرب الماء لسنين عديدة .',
    workingHours: '24 ساعة',
    requiredStamps: 12,
    collectedStamps: 0,
    similarPlaces: [],
    googleMapsLink: 'https://maps.app.goo.gl/p9GgFQvhFkMHrj818',
    entryFee: 'مجانا',
    stampType: 'silver',
    coordinates: null,
    categories: ['تراث'],
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
        preferredSize: Size.fromHeight(130 + MediaQuery.paddingOf(context).top),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: DiscoverTopBar(
            userInfo: userInfo,
            children: [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CategoriesSection(categories: categories),
            const SizedBox(height: 16),
            PopularPlacesSection(
              title: 'الأكثر زيارة',
              places: popularPlaces.take(6).toList(),
            ),
            const SizedBox(height: 16),
            PopularPlacesSection(
              title: 'الفعاليات الموسمية',
              places: eventPlaces.take(6).toList(),
            ),
            const SizedBox(height: 16),
            TracksSection(),
            const SizedBox(height: 32),
            const PlanTripSection(),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
