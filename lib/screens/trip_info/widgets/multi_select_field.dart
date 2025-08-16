import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../../../widgets/labeled_widget.dart';

class MultiSelectField extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onChanged;
  final String? Function(List<String>?)? validator;

  const MultiSelectField({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledWidget(
      label: label,
      child: FormField<List<String>>(
        initialValue: selectedValues,
        validator: validator,
        builder: (FormFieldState<List<String>> state) {
          const errorColor = Color.fromARGB(255, 209, 24, 11);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _showMultiSelectDialog(context, state),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: state.hasError ? errorColor : Colors.grey[300]!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedValues.isEmpty
                              ? ''
                              : selectedValues.join(' | '),
                          style: AppFonts.bodySmall.copyWith(
                            color: selectedValues.isEmpty
                                ? Colors.grey[600]
                                : Colors.black,
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      Text(
                        'اختيار متعدد',
                        style: AppFonts.caption.copyWith(
                          color: selectedValues.isEmpty
                              ? Colors.grey[600]
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    state.errorText!,
                    style: const TextStyle(color: errorColor, fontSize: 12),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showMultiSelectDialog(
    BuildContext context,
    FormFieldState<List<String>>? state,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        List<String> tempSelected = List.from(selectedValues);
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(label, style: AppFonts.heading3),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options.map((option) {
                    return CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(option),
                      value: tempSelected.contains(option),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            tempSelected.add(option);
                          } else {
                            tempSelected.remove(option);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('إلغاء'),
                ),
                ElevatedButton(
                  onPressed: () {
                    onChanged(tempSelected);
                    state?.didChange(tempSelected);
                    Navigator.pop(context);
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
