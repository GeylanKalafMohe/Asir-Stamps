import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../widgets/labeled_widget.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final String? selectText;
  final String? Function(T?)? validator;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.selectText = 'اختر',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledWidget(
      label: label,
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          errorMaxLines: 3,
          hintText: hintText,
          hintStyle: AppFonts.bodyMedium.copyWith(color: Colors.grey[600]),
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.navbarBackground,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          prefix: prefixIcon == null
              ? null
              : Container(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: prefixIcon,
                ),
        ),
        style: AppFonts.bodySmall.copyWith(color: Colors.black),
        dropdownColor: Colors.white,
        icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            if (selectText != null)
              Text(
                selectText!,
                style: AppFonts.caption.copyWith(color: Colors.grey[600]),
              ),
            // const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
