import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final String alertHeading;
  final String alertText;

  AlertBox({required this.alertHeading, required this.alertText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 360 ? 400 : 320;
    return Container(
      width: containerWidth,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED) /* surface-support */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/images/info.png'),
                ),

                SizedBox(width: 8),
                BodyBold16(text: alertHeading),
              ],
            ),
            SS8(),
            BodyRegular14(text: alertText, color: AppColors.labelGrey),
          ],
        ),
      ),
    );
  }
}
