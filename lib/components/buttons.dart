import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:flutter/material.dart';

class MPrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  MPrimaryButton({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFC8102E) /* brand-primary-500-default */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [BodyRegular14(text: buttonText, color: Colors.white)],
          ),
        ),
      ),
    );
  }
}

class DGPrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  DGPrimaryButton({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF2E3031) /* brand-primary-500-default */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [BodyRegular14(text: buttonText, color: Colors.white)],
          ),
        ),
      ),
    );
  }
}

class LinkBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back, size: 14, color: AppColors.labelGrey),
        BodyBold14(text: 'Back', color: AppColors.statusBlue),
      ],
    );
  }
}

class DGOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  DGOutlinedButton({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white, // White fill
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.labelGrey), // Grey border
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.black, // Black text color
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
