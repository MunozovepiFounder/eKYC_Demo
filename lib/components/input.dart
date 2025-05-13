import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final void Function(String?) onChanged;
  final String labelText;
  final double containerWidth;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.hintText = 'Select an option',
    required this.labelText,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyBold14(text: labelText, color: AppColors.labelGrey),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              isDense: true, // reduces height
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_drop_down, size: 24),
            hint: Text(hintText, style: const TextStyle(fontSize: 14)),
            items:
                items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class YesNoRadioRow extends StatelessWidget {
  final bool? selectedValue;
  final void Function(bool?) onChanged;

  const YesNoRadioRow({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: selectedValue,
              onChanged: onChanged,
            ),
            const Text('Yes'),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: selectedValue,
              onChanged: onChanged,
            ),
            const Text('No'),
          ],
        ),
      ],
    );
  }
}

//the upload component
class UploadBox extends StatelessWidget {
  final void Function(PlatformFile file) onFilePicked;
  final IconData icon;
  final String label;
  final double containerWidth;
  final String labelText;

  const UploadBox({
    Key? key,
    required this.onFilePicked,
    this.icon = Icons.upload_file,
    this.label = 'Upload PDF or PNG',
    required this.containerWidth,
    required this.labelText,
  }) : super(key: key);

  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      onFilePicked(result.files.first);
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No file selected.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickFile(context),
      child: Container(
        width: containerWidth,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyRegular14(text: labelText, color: AppColors.labelGrey),
            SS8(),
            Container(
              width: containerWidth,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 24, color: AppColors.labelGrey),
                  const SizedBox(width: 8),
                  Text(label, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool showAsterisk;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final double containerWidth;
  final bool isDisabled;
  final String? disabledText; // NEW: the text to show when disabled

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.showAsterisk = false,
    required this.controller,
    this.onChanged,
    required this.containerWidth,
    this.isDisabled = false,
    this.disabledText, // NEW
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the controller's text if disabledText is provided
    if (isDisabled && disabledText != null && controller.text != disabledText) {
      controller.text = disabledText!;
    }

    return Container(
      width: containerWidth,
      height: 64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BodyBold14(text: labelText, color: AppColors.labelGrey),
              if (showAsterisk)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
          SS8(),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: isDisabled ? null : onChanged,
              enabled: !isDisabled,
              style: TextStyle(
                color: isDisabled ? Colors.grey.shade800 : Colors.black,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: isDisabled ? Colors.grey.shade100 : Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDatePickerField extends StatelessWidget {
  final String labelText;
  final DateTime? selectedDate;
  final void Function(DateTime)? onDateSelected;
  final double containerWidth;
  final bool disabled;
  final String? displayValueWhenDisabled;

  const CustomDatePickerField({
    Key? key,
    required this.labelText,
    this.selectedDate,
    this.onDateSelected,
    required this.containerWidth,
    this.disabled = false,
    this.displayValueWhenDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayText =
        disabled
            ? (displayValueWhenDisabled ?? '')
            : selectedDate != null
            ? DateFormat('yyyy-MM-dd').format(selectedDate!)
            : 'Select date';

    return Container(
      width: containerWidth,
      height: 64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyBold14(text: labelText, color: AppColors.labelGrey),
          SS8(),
          GestureDetector(
            onTap:
                disabled
                    ? null
                    : () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null && onDateSelected != null) {
                        onDateSelected!(pickedDate);
                      }
                    },
            child: AbsorbPointer(
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: displayText),
                style: TextStyle(
                  color: disabled ? Colors.grey[800] : Colors.black,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: disabled ? Colors.grey[200] : Colors.white,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlagItem {
  final String assetPath;
  final String countryName;

  FlagItem({required this.assetPath, required this.countryName});
}

class FlagDropdown extends StatefulWidget {
  final Function(FlagItem) onChanged;
  final FlagItem? initialValue;
  final String labelText;

  const FlagDropdown({
    Key? key,
    required this.onChanged,
    this.initialValue,
    required this.labelText,
  }) : super(key: key);

  @override
  State<FlagDropdown> createState() => _FlagDropdownState();
}

class _FlagDropdownState extends State<FlagDropdown> {
  late FlagItem? selectedFlag;

  final List<FlagItem> flags = [
    FlagItem(assetPath: 'assets/flags/MU.png', countryName: 'Mauritius'),
    FlagItem(assetPath: 'assets/flags/FR.png', countryName: 'France'),
    FlagItem(assetPath: 'assets/flags/GB.png', countryName: 'Britain'),
    FlagItem(assetPath: 'assets/flags/IN.png', countryName: 'India'),
    FlagItem(assetPath: 'assets/flags/NG.png', countryName: 'Nigeria'),
    FlagItem(assetPath: 'assets/flags/US.png', countryName: 'United States'),
    FlagItem(assetPath: 'assets/flags/ZA.png', countryName: 'South Africa'),
  ];

  @override
  void initState() {
    super.initState();
    selectedFlag = widget.initialValue ?? flags[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyBold14(text: widget.labelText, color: AppColors.labelGrey),
        SS8(),
        DropdownButtonFormField<FlagItem>(
          value: selectedFlag,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          items:
              flags.map((flag) {
                return DropdownMenuItem<FlagItem>(
                  value: flag,
                  child: Row(
                    children: [
                      Image.asset(flag.assetPath, width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text(
                        flag.countryName,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }).toList(),
          onChanged: (FlagItem? newValue) {
            if (newValue != null) {
              setState(() => selectedFlag = newValue);
              widget.onChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}
