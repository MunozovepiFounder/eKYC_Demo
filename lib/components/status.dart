import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final String status; // 'completed', 'active', or 'inactive'
  final String circleText;
  final String labelText;

  const CustomStepper({
    required this.status,
    required this.circleText,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color circleColor;
    Widget circleChild;

    switch (status) {
      case 'completed':
        circleColor = AppColors.statusGreen;
        circleChild = const Icon(Icons.check, color: Colors.white, size: 16);
        break;
      case 'active':
        circleColor = AppColors.statusBlue;
        circleChild = BodyBold12(text: circleText, color: Colors.white);
        break;
      case 'inactive':
      default:
        circleColor = AppColors.lightGrey;
        circleChild = BodyBold12(text: circleText, color: AppColors.labelGrey);
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(child: circleChild),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//divider line

class LineInStepper extends StatelessWidget {
  const LineInStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 2),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 8),
          child: Container(
            width: 10,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: const Color(0xFFDFDFDF) /* border-divider */,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 2),
      ],
    );
  }
}

//the completed stepper"
class CustomerProfileStepper extends StatelessWidget {
  final String step1Status;
  final String step2Status;
  final String step3Status;
  final String step4Status;
  final String activeLabel;
  final bool backButton;

  CustomerProfileStepper({
    required this.step1Status,
    required this.step2Status,
    required this.step3Status,
    required this.step4Status,
    required this.activeLabel,
    required this.backButton,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 360 ? 400 : 320;

    return Container(
      //color: Colors.amber,
      width: containerWidth,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SS32(),
                backButton
                    ? Column(children: [LinkBackButton(), SS16()])
                    : NullBox(),
                BodyBold14(text: activeLabel),
                SS8(),

                Row(
                  children: [
                    CustomStepper(
                      status: step1Status,
                      circleText: '1',
                      labelText: 'Get started',
                    ),
                    LineInStepper(),
                    CustomStepper(
                      status: step2Status,
                      circleText: '2',
                      labelText: 'Review your details',
                    ),
                    LineInStepper(),
                    CustomStepper(
                      status: step3Status,
                      circleText: '3',
                      labelText: 'Verification',
                    ),
                    LineInStepper(),
                    CustomStepper(
                      status: step4Status,
                      circleText: '4',
                      labelText: 'Submission',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
