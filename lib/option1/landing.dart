import 'package:ekyc_prototypes/components/alerts.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/header.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/option1/detailsPage.dart';
import 'package:flutter/material.dart';

class Option1Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 360 ? 400 : 320;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveContainer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerProfileStepper(
                backButton: false,
                step1Status: 'active',
                step2Status: 'inactive',
                step3Status: 'inactive',
                step4Status: 'inactive',
                activeLabel: 'Get started',
              ),
              SS40(),
              //image

              //Container(
              // width: containerWidth,
              // height: 130.57,
              // child: Image.asset('assets/images/biometrics.png'),
              //),

              // the informative message:

              // the information box
              AlertBox(
                alertHeading: 'Welcome to your profile',
                alertText:
                    'You can update and amend your details. Keeping your details up to date, helps personalise your experience and keeps you compliant.',
              ),

              SS32(),
              BodyBold16(
                text: 'How to get started',
                color: AppColors.labelGrey,
              ),
              SS16(),
              //the bullet points
              BulletPoints(
                link: false,
                bulletText: 'Easily manage and amend your personal details',
                linkText: 'ww',
              ),
              SS8(),
              BulletPoints(
                link: true,
                bulletText: 'For any documents needed you can upload your',
                linkText: 'MoKloud documents. Learn more',
              ),
              SS8(),
              BulletPoints(
                link: false,
                bulletText:
                    'Your document may have to be reviewed before any changes can be updated. We inform you of the status of any updates to your profile.',
              ),

              SS72(),
              //the continue button
              MPrimaryButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Detailspage()),
                  );
                },
                buttonText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
