import 'package:asir_stamps_app/models/category_item.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/category_card.dart';
import 'package:asir_stamps_app/screens/trip_planner/widgets/section_widget.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryItem> categories;

  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'التصنيفات',
      content: SizedBox(
        height: 100,
        child: ListView.builder(
          padding: EdgeInsetsDirectional.only(start: 12),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) =>
              CategoryCard(item: categories[index]),
        ),
      ),
    );
  }
}
